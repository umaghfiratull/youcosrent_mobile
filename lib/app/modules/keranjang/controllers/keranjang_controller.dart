import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:cosplay_rental/app/modules/navigation/views/navigation_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../../../data/apiconfig.dart';
import '../../../model/cartItem.dart';
import '../../transaksi/views/transaksi_view.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class KeranjangController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var selectedItems = RxList<bool>();
  var groupedItems = <String, List<CartItem>>{}.obs;
  List<CartItem> selectedCartItems = [];
  late List<dynamic> items;
  late List<CartItem> selectedItemsList; // Change type here
  final isCodSelected = true.obs;
  final isTfSelected = false.obs;
  var selectedFile = Rxn<FilePickerResult>();
  Rx<File?> image =
      Rx<File?>(null); // Make sure this declaration is at the class level
  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  String formatGroupKey(String groupKey) {
    // Split the groupKey into start and end dates
    List<String> dates = groupKey.split(' - ');
    if (dates.length != 2)
      return groupKey; // Return original if the format is unexpected

    String startDateStr = dates[0];
    String endDateStr = dates[1];

    // Parse and format the start date
    DateTime startDate = DateTime.parse(startDateStr);
    String formattedStartDate = DateFormat('dd MMM').format(startDate);

    // Parse and format the end date
    DateTime endDate = DateTime.parse(endDateStr);
    String formattedEndDate = DateFormat('dd MMM').format(endDate);

    // Combine the formatted dates
    return '$formattedStartDate - $formattedEndDate';
  }

  String formatDateString(String dateStr) {
    DateTime date = DateTime.parse(dateStr); // Parse the date string
    return DateFormat('dd MMM').format(date); // Format the date
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      selectedFile.value = result;
      String fileName = path.basename(result.files.first.path!);
      print('File picked: $fileName'); // This will print just the file name
    } else {
      print('File picker canceled');
    }
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String cartItemsString = prefs.getString('cartItems_$token') ?? '[]';
    items = json.decode(cartItemsString);

    cartItems.value = items.map((item) {
      return CartItem(
        name: item['name'],
        id: item['id'],
        harga: item['harga'],
        gambar: item['gambar'],
        duration: item['duration'],
        startDate: item['startDate'],
        endDate: item['endDate'],
      );
    }).toList();

    selectedItems.value = List<bool>.filled(cartItems.length, false);
    groupItemsByDateRange();
  }

  void groupItemsByDateRange() {
    Map<String, List<CartItem>> grouped = {};
    for (var item in cartItems) {
      String dateRange = '${item.startDate} - ${item.endDate}';
      if (!grouped.containsKey(dateRange)) {
        grouped[dateRange] = [];
      }
      grouped[dateRange]!.add(item);
    }
    groupedItems.value = grouped;
  }

  void clearSelections() {
    for (int i = 0; i < selectedItems.length; i++) {
      selectedItems[i] = false;
    }
  }

  void toggleSelection(int groupIndex, int itemIndex) {
    var item = groupedItems.values.toList()[groupIndex][itemIndex];
    int globalIndex = cartItems.indexOf(item);

    bool isSelected = selectedItems[globalIndex];
    if (!isSelected) {
      String selectedStartDate = cartItems[globalIndex].startDate;
      String selectedEndDate = cartItems[globalIndex].endDate;

      bool shouldClearSelection = false;

      for (int i = 0; i < selectedItems.length; i++) {
        if (selectedItems[i]) {
          String startDate = cartItems[i].startDate;
          String endDate = cartItems[i].endDate;
          if (startDate != selectedStartDate || endDate != selectedEndDate) {
            shouldClearSelection = true;
            break;
          }
        }
      }

      if (shouldClearSelection) {
        clearSelections();
      }
    }

    selectedItems[globalIndex] = !isSelected;

    if (!isSelected) {
      selectedCartItems.add(item);
    } else {
      selectedCartItems.remove(item);
    }
  }

  void removeItemFromCart(int index) async {
    cartItems.removeAt(index);
    await saveCartItemsToSharedPreferences();
    groupItemsByDateRange();
  }

  Future<void> saveCartItemsToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String cartItemsString = json.encode(cartItems.toList());
    await prefs.setString('cartItems_$token', cartItemsString);
  }

  double get totalPrice {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      if (selectedItems[i]) {
        total += cartItems[i].harga;
      }
    }
    return total;
  }

  void proceedToTransaction(String groupKey) {
    selectedItemsList = cartItems
        .asMap()
        .entries
        .map((entry) {
          int index = entry.key;
          CartItem item = entry.value;
          if (selectedItems[index]) {
            return item;
          } else {
            return null;
          }
        })
        .where((item) => item != null)
        .cast<CartItem>() // Cast to CartItem
        .toList();

    if (selectedItemsList.isNotEmpty) {
      Get.to(() => TransaksiView(
          selectedItems: selectedItemsList,
          groupKey: groupKey)); // Pass selectedItemsList
    } else {
      Get.snackbar('Error', 'No items selected');
    }
  }

  int calculateDuration(String dateRange) {
    // Split the dateRange string into start and end date strings
    List<String> dates = dateRange.split(' - ');
    String startDateStr = dates[0];
    String endDateStr = dates[1];

    // Parse the start and end dates
    DateTime startDate = DateTime.parse(startDateStr);
    DateTime endDate = DateTime.parse(endDateStr);

    // Calculate the difference in days
    Duration difference = endDate.difference(startDate);

    return difference.inDays;
  }

  Future<void> postOrdercod({
    required String startDate,
    required String endDate,
    required int durasi,
    required int bayar,
    required List<CartItem> selectedItemsList,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      int? id = prefs.getInt('id');
      var url = Uri.parse(Api.transaksi);
      String modelBayar = "cod"; // Ensure TF is selected

      // Create HTTP request
      var request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
        });

      // Add transaction data to body
      Map<String, dynamic> transaksis = {
        "id_user": 1,
        "id_pelanggan": id,
        "tanggal_sewa": startDate,
        "tanggal_akhir": endDate,
        "tanggal_kembali": "2024-05-01",
        "durasi": durasi,
        "bayar": bayar,
        "kurang_bayar": 0,
        "total_harga": bayar,
        "total_denda": 0,
        "status_pengembalian": "belum",
        "status_konfirmasi": "belum_terkonfirmasi",
        "model_bayar": modelBayar,
        "total_ongkir": 0,
        "created_at": "2024-05-01T00:00:00",
        "updated_at": "2024-05-01T00:00:00"
      };

      // Convert detail_transaksi to a list of maps before encoding
      List<Map<String, dynamic>> detailList =
          selectedItemsList.map((item) => item.toJson()).toList();

      // Encoding the entire payload as JSON instead of using form fields
      Map<String, dynamic> body = {
        "transaksi": transaksis,
        "detail_transaksi": detailList,
      };

      // Attach JSON body as a single field
      request.fields['data'] = json.encode(body);

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {
        Get.snackbar('Error', 'Order TF error');
        print('Request failed with status: ${response.statusCode}.');
        print('Response body: ${response.body}');
      } else {
        Get.snackbar('Success', 'Order Success');
        Get.offAll(() => NavigationView());
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
      print(e);
    } finally {}
  }

  // Function to post order with TF payment method
  Future<void> postOrdertf({
    required String startDate,
    required String endDate,
    required int durasi,
    required int bayar,
    required List<CartItem> selectedItemsList,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      int? id = prefs.getInt('id');
      var url = Uri.parse(Api.transaksi);
      String modelBayar = "tf"; // Ensure TF is selected

      // Create HTTP request
      var request = http.MultipartRequest('POST', url)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
        });

      // Add transaction data to body
      Map<String, dynamic> transaksis = {
        "id_user": 1,
        "id_pelanggan": id,
        "tanggal_sewa": startDate,
        "tanggal_akhir": endDate,
        "tanggal_kembali": "2024-05-01",
        "durasi": durasi,
        "bayar": bayar,
        "kurang_bayar": 0,
        "total_harga": bayar,
        "total_denda": 0,
        "status_pengembalian": "belum",
        "status_konfirmasi": "belum_terkonfirmasi",
        "model_bayar": modelBayar,
        "total_ongkir": 0,
        "created_at": "2024-05-01T00:00:00",
        "updated_at": "2024-05-01T00:00:00"
      };

      // Convert detail_transaksi to a list of maps before encoding
      List<Map<String, dynamic>> detailList =
          selectedItemsList.map((item) => item.toJson()).toList();

      // Encoding the entire payload as JSON instead of using form fields
      Map<String, dynamic> body = {
        "transaksi": transaksis,
        "detail_transaksi": detailList,
      };

      // Attach JSON body as a single field
      request.fields['data'] = json.encode(body);

      // Add file for proof of payment if transfer method
      if (selectedFile.value != null) {
        var images = await http.MultipartFile.fromPath(
            'transaksi[bukti_bayar]', selectedFile.value!.files.first.path!);
        request.files.add(images);
      }

      print('Request Fields: ${request.fields}');
      print('Request Files: ${request.files}');

      // Send request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {
        Get.snackbar('Error', 'Order TF error');
        print('Request failed with status: ${response.statusCode}.');
        print('Response body: ${response.body}');
      } else {
        Get.snackbar('Success', 'Order Success');
        Get.offAll(() => NavigationView());
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
      print(e);
    }
  }
}

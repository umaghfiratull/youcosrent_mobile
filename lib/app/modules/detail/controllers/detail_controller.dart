import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DetailController extends GetxController {
  final RxString address = ''.obs;
  final TextEditingController addressController = TextEditingController();

  final Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  final Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);
  bool isDateRangeSelected = false;

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    address.value = prefs.getString('address') ?? 'Tidak Ada Token';
  }

  String getDurationString() {
    if (selectedStartDate.value == null || selectedEndDate.value == null) {
      return '';
    }

    Duration difference =
        selectedEndDate.value!.difference(selectedStartDate.value!);
    int days = difference.inDays;
    return '$days hari';
  }

  Future<void> addToCart(String name, String size, int harga, String gambar,
      int stok, int id) async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token') ?? '';

    String cartItemsString = prefs.getString('cartItems_$token') ?? '[]';
    List<dynamic> cartItems = json.decode(cartItemsString);
    String durationString = getDurationString();

    cartItems.add({
      'name': name,
      'id': id,
      'size': size,
      'harga': harga,
      'gambar': gambar,
      'startDate': formatter.format(selectedStartDate.value!),
      'endDate': formatter.format(selectedEndDate.value!),
      'duration': durationString,
      'token': token,
    });

    await prefs.setString('cartItems_$token', json.encode(cartItems));
    Get.snackbar('Success', 'Item added to cart');
  }

  Map<String, List<dynamic>> groupCartItemsByDateRange(
      List<dynamic> cartItems) {
    Map<String, List<dynamic>> groupedItems = {};
    for (var item in cartItems) {
      String dateRange = '${item['startDate']} - ${item['endDate']}';
      if (!groupedItems.containsKey(dateRange)) {
        groupedItems[dateRange] = [];
      }
      groupedItems[dateRange]!.add(item);
    }
    return groupedItems;
  }

  Future<Map<String, List<dynamic>>> getGroupedCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    String cartItemsString = prefs.getString('cartItems_$token') ?? '[]';
    List<dynamic> cartItems = json.decode(cartItemsString);
    return groupCartItemsByDateRange(cartItems);
  }
}

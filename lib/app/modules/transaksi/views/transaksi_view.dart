import 'package:cosplay_rental/app/data/provider/format.dart';
import 'package:cosplay_rental/app/modules/keranjang/controllers/keranjang_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/cartItem.dart';
import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  final List<CartItem> selectedItems; // Update the type to List<CartItem>
  final String groupKey;
  TransaksiView({Key? key, required this.selectedItems, required this.groupKey})
      : super(key: key);
  final TransaksiController controllerc = Get.put(TransaksiController());
  final KeranjangController keranjangController =
      Get.find<KeranjangController>();
  @override
  Widget build(BuildContext context) {
    List<String> dates = groupKey.split(' - ');

    // Assign the split dates to separate variables
    String startDate = dates[0];
    String endDate = dates[1];
    int duration = keranjangController.calculateDuration(groupKey);

    int totalHargaSewa = 0;
    for (var item in selectedItems) {
      totalHargaSewa += item.harga as int;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: Colors.grey[900]!,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controllerc.name.value,
                              style: TextStyle(
                                  color: Color(0xff231d1f),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed('/address'),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      8.0,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '  Edit  ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          controllerc.phone.value,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          controllerc.address.value,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tanggal Sewa"),
                    Text(keranjangController.formatGroupKey(groupKey)),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                // width: 100,

                child: ListView.builder(
                  itemCount: selectedItems.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = selectedItems[index];
                    String formattedStartDate =
                        keranjangController.formatDateString(item.startDate);
                    String formattedEndDate =
                        keranjangController.formatDateString(item.endDate);
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              item.gambar,
                              width: 80,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '${(item.harga as int).toRupiah()}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    item.duration,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '${formattedStartDate} - ${formattedEndDate}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga Total Sewa',
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            totalHargaSewa.toRupiah(),
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ongkir',
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp.0',
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Harga Bayar Sewa',
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            totalHargaSewa.toRupiah(),
                            style: TextStyle(
                                color: Color(0xff231d1f),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  paymentMethod(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' Pilih Metode :',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        FittedBox(
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 7, right: 7, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                                color: const Color(0xFFD0E0FE),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              keranjangController.isCodSelected.value
                                  ? ' COD '
                                  : ' Transfer ',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  keranjangController.isCodSelected.value == true
                      ? await keranjangController.postOrdercod(
                          bayar: totalHargaSewa,
                          durasi: duration,
                          endDate: endDate,
                          startDate: startDate,
                          selectedItemsList: selectedItems)
                      : await keranjangController.postOrdertf(
                          bayar: totalHargaSewa,
                          durasi: duration,
                          endDate: endDate,
                          startDate: startDate,
                          selectedItemsList: selectedItems);
                },
                child: const Text("Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void paymentMethod(BuildContext context) {
    Get.bottomSheet(Container(
      height: MediaQuery.of(context).size.height * 0.30,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                keranjangController.isCodSelected.value = true;
                keranjangController.isTfSelected.value = false;
                Get.back();
              },
              child: Container(
                //
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  // color: Colors.orange,
                  border: Border.all(
                    width: 1.5,
                    color: keranjangController.isCodSelected.value
                        ? Colors.blue
                        : Colors.grey,
                  ),

                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      // ini container dot
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: keranjangController.isCodSelected.value
                                  ? Colors.blue
                                  : Colors.grey),
                          color: keranjangController.isCodSelected.value
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.payment,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'COD',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                keranjangController.isCodSelected.value = false;
                keranjangController.isTfSelected.value = true;
                Get.back();
                _showLogoutDialog();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  // color: Colors.orange,
                  border: Border.all(
                    width: 1.5,
                    color: keranjangController.isTfSelected.value
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: keranjangController.isTfSelected.value
                                ? Colors.blue
                                : Colors.grey,
                          ),
                          color: keranjangController.isTfSelected.value
                              ? Colors.blue
                              : Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.developer_board,
                      size: 24.0,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Transfer',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Screenshot untuk bayar",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20), // Adds some spacing
          Image.asset(
              'assets/image.png'), // Displaying the barcode image from assets
          // If the image is from a network source, use Image.network('URL')
        ],
      ),
      barrierDismissible: false,
      actions: [
        ElevatedButton(
          onPressed: () async {
            Get.back(); // Close the dialog
            await keranjangController.pickFile();
          },
          child: Text('Ok'),
        ),
      ],
    );
  }
}

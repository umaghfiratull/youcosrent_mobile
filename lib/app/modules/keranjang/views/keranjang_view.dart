 -import 'package:cosplay_rental/app/data/provider/format.dart';
import 'package:cosplay_rental/app/modules/transaksi/views/transaksi_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/collor.dart';
import '../controllers/keranjang_controller.dart';

class KeranjangView extends StatelessWidget {
  KeranjangView({Key? key}) : super(key: key);
  String? groupKeyy; // Tambahkan variabel groupKey
  @override
  Widget build(BuildContext context) {
    final KeranjangController controller = Get.put(KeranjangController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: Obx(() {
        if (controller.groupedItems.isEmpty) {
          return Center(child: Text('Keranjang kosong'));
        }
        return ListView.builder(
          itemCount: controller.groupedItems.keys.length,
          itemBuilder: (context, groupIndex) {
            groupKeyy = controller.groupedItems.keys.toList()[groupIndex];

            String groupKey = controller.groupedItems.keys.toList()[groupIndex];
            String formattedGroupKey = controller.formatGroupKey(groupKey);

            var groupItems = controller.groupedItems[groupKey]!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    formattedGroupKey,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                ...List.generate(groupItems.length, (itemIndex) {
                  var item = groupItems[itemIndex];
                  int globalIndex = controller.cartItems.indexOf(item);
                  String formattedStartDate =
                      controller.formatDateString(item.startDate);
                  String formattedEndDate =
                      controller.formatDateString(item.endDate);
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() => Checkbox(
                                value: controller.selectedItems[globalIndex],
                                onChanged: (bool? newValue) {
                                  controller.toggleSelection(
                                      groupIndex, itemIndex);
                                },
                              )),
                          SizedBox(width: 10),
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
                                  '${item.duration}',
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
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              controller.removeItemFromCart(globalIndex);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        );
      }),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Total sewa"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          '${controller.totalPrice.toRupiahDouble()}',
                          style: TextStyle(
                            color: Color(0xff231d1f),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      Obx(() {
                        int selectedCount = controller.selectedItems
                            .where((item) => item)
                            .length;
                        return Text(
                          '$selectedCount item(s)',
                          style: TextStyle(
                              color: Color(0xff231d1f),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: FloatingActionButton(
                backgroundColor: AppColor.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.grey),
                ),
                onPressed: () async {
                  controller.proceedToTransaction(groupKeyy!);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Tambahkan ke keranjang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

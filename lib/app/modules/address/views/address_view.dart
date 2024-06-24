import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/address_controller.dart';

class AddressView extends GetView<AddressController> {
  AddressView({Key? key}) : super(key: key);
  final AddressController addressController = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/address-field');
            },
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
        title: Text(
          'Alamat',
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Font Weight untuk yang terpilih
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 1,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Set border color
                    width: 2.0, // Set border width
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Home',
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                    fontWeight: FontWeight
                                        .bold, // Font Weight untuk yang terpilih
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    size: 20.0,
                                    color: Colors.green[300],
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'UTAMA',
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight
                                            .bold, // Font Weight untuk yang terpilih
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '${addressController.name.value}',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight
                                    .bold, // Font Weight untuk yang terpilih
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '| ${addressController.phone.value}',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight
                                    .bold, // Font Weight untuk yang terpilih
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${addressController.address.value}',
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight
                                .bold, // Font Weight untuk yang terpilih
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Hapus',
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight
                                            .bold, // Font Weight untuk yang terpilih
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_document,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Edit',
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight
                                            .bold, // Font Weight untuk yang terpilih
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

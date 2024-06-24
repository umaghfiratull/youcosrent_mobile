import 'package:cosplay_rental/app/modules/history/controllers/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:cosplay_rental/app/data/provider/format.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/history_my_order_controller.dart';

class HistoryMyOrderView extends GetView<HistoryMyOrderController> {
  HistoryMyOrderView({Key? key}) : super(key: key);
  final HistoryController controllerHistory = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controllerHistory.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (controllerHistory.modelDataHistory.data == null ||
          controllerHistory.modelDataHistory.data!.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        child: ListView.builder(
          itemCount: controllerHistory.modelDataHistory.data?.length ?? 0,
          itemBuilder: (context, index) {
            var order = controllerHistory.modelDataHistory.data?[index];
            return Card(
              color: Colors.white,
              key: ValueKey(order?.id),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/50'),
                    ),
                    title: Text(
                      "#${order?.id}",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Text(
                      "${order?.tanggalSewa}",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Durasi Sewa",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Text(
                                "${order?.durasi ?? 0} Hari",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ),
                              Text(
                                "${order?.totalHarga?.toRupiah() ?? 'N/A'}",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Status",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal)),
                              Text(
                                _getStatusText(order?.statusKonfirmasi),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: _getStatusColor(
                                            order?.statusKonfirmasi),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ]),
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

Color _getStatusColor(String? status) {
  switch (status) {
    case 'belum_terkonfirmasi':
      return Colors.red;
    case 'sudah_terkonfirmasi':
      return Colors.green;
    case 'tidak_terkonfirmasi':
      return Colors.red;
    default:
      return Colors.black;
  }
}

String _getStatusText(String? status) {
  switch (status) {
    case 'belum_terkonfirmasi':
      return 'Belum Terkonfirmasi';
    case 'sudah_terkonfirmasi':
      return 'Sudah Terkonfirmasi';
    case 'tidak_terkonfirmasi':
      return 'Ditolak';
    default:
      return 'N/A';
  }
}

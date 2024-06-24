import 'package:cosplay_rental/app/modules/pesanan_myOrder/views/pesanan_my_order_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../history_myOrder/views/history_my_order_view.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({Key? key}) : super(key: key);
  final HistoryController historyController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Order',
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          controller: historyController.tabController,
          labelStyle: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Font Weight untuk yang terpilih
            ),
          ),
          unselectedLabelStyle: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight:
                  FontWeight.normal, // Font Weight untuk yang tidak terpilih
            ),
          ),
          tabs: [
            Tab(text: "PESANAN"),
            Tab(text: "RIWAYAT"),
          ],
        ),
      ),
      body: TabBarView(
        controller: historyController.tabController,
        children: [
          PesananMyOrderView(),
          HistoryMyOrderView(),
        ],
      ),
    );
  }
}

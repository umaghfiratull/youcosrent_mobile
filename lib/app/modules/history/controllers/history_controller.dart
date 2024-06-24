import 'dart:convert';

import 'package:cosplay_rental/app/data/apiconfig.dart';
import 'package:cosplay_rental/app/data/provider/menu_provider.dart';
import 'package:cosplay_rental/app/model/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement HistoryController
  late AnimationController _controller;
  late TabController tabController;
  late MyOrders modelDataPesanan = MyOrders();
  var dataModelDataPesanan = <DataMyOrder>[].obs;
  late MyOrders modelDataHistory = MyOrders();
  var dataModelDataHistory = <DataMyOrder>[].obs;
  final menuProvider = MenuProvider().obs;
  final isLoading = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabSelection);
    loadPesananMyOrder();
    loadHistoryMyOrder();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          loadPesananMyOrder();
          break;
        case 1:
          loadHistoryMyOrder();
          print('d');
          break;
      }
    }
  }

  Future<void> loadPesananMyOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(Api.dataPesanan),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Berhasil mendapatkan pesanan
      print('Berhasil mendapatkan pesanan');

      // Parse the response body to JSON
      final jsonResponse = json.decode(response.body);

      // Create an instance of MyOrders from the JSON response
      MyOrders myOrders = MyOrders.fromJson(jsonResponse);

      // Update your modelDataPesanan and dataModelDataPesanan accordingly
      modelDataPesanan = myOrders;
      dataModelDataPesanan.assignAll(myOrders.data ?? []);
      isLoading(false);
    } else {
      // Gagal mendapatkan pesanan
      print('Gagal mendapatkan pesanan. Status code: ${response.statusCode}');
      throw Exception('Gagal mendapatkan pesanan');
    }
  }

  Future<void> loadHistoryMyOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(Api.dataHistory),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Berhasil mendapatkan pesanan
      print('Berhasil mendapatkan pesanan');

      // Parse the response body to JSON
      final jsonResponse = json.decode(response.body);

      // Create an instance of MyOrders from the JSON response
      MyOrders myOrders = MyOrders.fromJson(jsonResponse);

      // Update your modelDataPesanan and dataModelDataPesanan accordingly
      modelDataHistory = myOrders;
      dataModelDataHistory.assignAll(myOrders.data ?? []);
      isLoading(false);
    } else {
      // Gagal mendapatkan pesanan
      print('Gagal mendapatkan pesanan. Status code: ${response.statusCode}');
      throw Exception('Gagal mendapatkan pesanan');
    }
  }
}

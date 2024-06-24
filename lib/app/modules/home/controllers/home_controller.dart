import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apiconfig.dart';
import '../../../data/provider/menu_provider.dart';
import '../../../model/model_model.dart';
import "package:http/http.dart" as http;

class HomeController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement HomeController
  var selectedIndex = 0.obs;
  late TabController tabController;
  final isLoading = true.obs;
  final menuProvider = MenuProvider().obs;
  late Model modelterbaru = Model();
  var dataModelTerbaru = <Data>[].obs;

  late Model modelterlaris = Model();
  var dataModelTerlaris = <Data>[].obs;

  late Model modelkostum = Model();
  var dataModelKostum = <Data>[].obs;

  late Model modelAksesoris = Model();
  var dataModelAksesoris = <Data>[].obs;

  late Model modelproperti = Model();
  var dataModelProperti = <Data>[].obs;

  late Model modelsepatu = Model();
  var dataModelSepatu = <Data>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 6, vsync: this);
    fetchInitialData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchInitialData() {
    loadTerbaru();
    loadAksesoris();
    loadKostum();
    loadProperti();
    loadTerlaris();
    loadSepatu();
  }

  RxList<int> favoriteIds = <int>[].obs;

  // Function to toggle favorite status of an item
  void toggleFavorite(int itemId) {
    if (favoriteIds.contains(itemId)) {
      favoriteIds.remove(itemId);
    } else {
      favoriteIds.add(itemId);
    }
  }

  void increment() => count.value++;
  void onTabSelected(int index) {
    tabController.animateTo(index);
    selectedIndex.value = index;
    switch (index) {
      case 0:
        loadTerbaru();
        break;
      case 1:
        loadTerlaris();
        break;
      case 2:
        loadKostum();
        break;
      case 3:
        loadAksesoris();
        break;
      case 4:
        loadProperti();
        break;
      case 5:
        loadSepatu();
        break;
    }
  }

  Future<void> loadTerbaru() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangTerbaru();
      modelterbaru = result;
      dataModelTerbaru.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }

  Future<void> loadTerlaris() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangTerlaris();
      modelterlaris = result;
      dataModelTerlaris.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }

  Future<void> loadKostum() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangKostum();
      modelkostum = result;
      dataModelKostum.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }

  Future<void> loadAksesoris() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangAksesoris();
      modelAksesoris = result;
      dataModelAksesoris.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }

  Future<void> loadProperti() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangProperti();
      modelproperti = result;
      dataModelProperti.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }

  Future<void> loadSepatu() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangSepatu();
      modelsepatu = result;
      dataModelSepatu.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }
}

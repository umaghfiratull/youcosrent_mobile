import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/provider/menu_provider.dart';
import '../../../model/model_model.dart';

class SewaController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement SewaController
  late AnimationController _controller;
  late TabController tabController;
  final count = 0.obs;
  final menuProvider = MenuProvider().obs;
  late Model modelOntime = Model();
  var dataModelOntime = <Data>[].obs;
  late Model modelDreamcloset = Model();
  var dataModelDreamcloset = <Data>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabSelection);
    loadOntime();
    loadDreamcloset();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _handleTabSelection() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          loadOntime();
          break;
        case 1:
          loadDreamcloset();
          print('d');
          break;
      }
    }
  }

  Future<void> loadOntime() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangOntime();
      modelOntime = result;
      dataModelOntime.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }

  Future<void> loadDreamcloset() async {
    try {
      isLoading(true);
      final result = await menuProvider.value.fetchDataBarangdreamCLoset();
      modelDreamcloset = result;
      dataModelDreamcloset.assignAll(result.data!);
      isLoading(false);
    } catch (error) {
      isLoading(false);
      print('Error fetching data: $error');
    }
  }
}

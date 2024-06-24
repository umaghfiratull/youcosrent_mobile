import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

import '../../../data/apiconfig.dart';

class TransaksiController extends GetxController {
  //TODO: Implement TransaksiController

  final count = 0.obs;
  final RxString email = ''.obs; // Objek reaktif untuk token
  final RxString phone = ''.obs;
  final RxString name = ''.obs;
  final RxString address = ''.obs;
  final RxInt id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadSharedPreferencesData();
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
  void loadSharedPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('email') ?? 'Tidak Ada email';
    phone.value = prefs.getString('phone') ?? 'Tidak Ada phone';
    name.value = prefs.getString('name') ?? 'Tidak Ada name';
    address.value = prefs.getString('address') ?? 'Tidak Ada address';
    id.value = prefs.getInt('id') ?? 0;
  }

}

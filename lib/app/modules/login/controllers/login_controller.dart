import 'dart:convert';

import 'package:cosplay_rental/app/modules/navigation/views/navigation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apiconfig.dart';
import "package:http/http.dart" as http;

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final RxBool obscureText = true.obs;
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
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
  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login(String username, String password) async {
    try {
      // Tampilkan indikator loading
      isLoading.value = true;

      final data = {
        'email': username,
        'password': password,
      };

      final response =
          await http.post(Uri.parse(Api.loginCostumer), body: data);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final token = jsonResponse['data']['token'];
        final email = jsonResponse['data']['email'];
        final name = jsonResponse['data']['nama'];
        final address = jsonResponse['data']['alamat'];
        final phone = jsonResponse['data']['no_telfon'];
        final id = jsonResponse['data']['id'];

        await saveTokenToSharedPreferences(
            token, email, name, phone, address, id);

        Get.offAll(() => NavigationView());
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['data'];

        Get.snackbar(
          'Login Gagal',
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (error) {
      // Tangani pengecualian jika diperlukan
      print('An error occurred during login: $error');
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat login',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveTokenToSharedPreferences(
    String token,
    String email,
    String name,
    String phone,
    String address,
    int id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setString('name', name);
    await prefs.setString('phone', phone);
    await prefs.setString('address', address);
    await prefs.setInt('id', id);
  }
}

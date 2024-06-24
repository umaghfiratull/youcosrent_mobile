import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apiconfig.dart';
import "package:http/http.dart" as http;

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final RxBool obscureText = true.obs;
  final RxBool obscureText2 = true.obs;
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  RxList<String> searchResults = <String>[].obs;
  RxBool isSearching = false.obs; // Observable to control visibility
  Timer? _debounce;
  var gender = 'L'.obs; // Initialize with a default value

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

  void toggleObscureText2() {
    obscureText2.value = !obscureText2.value;
  }

  Future<void> searchAddress(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      isSearching.value = false; // Hide the container when the query is empty

      return;
    }
    isSearching.value = true; // Hide the container when the query is empty

    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&countrycodes=id');
    final response = await http.get(url,
        headers: {'User-Agent': 'YourAppName/1.0 (ContactEmail@example.com)'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      searchResults.value =
          data.map((e) => e['display_name'] as String).toList();
    } else {
      throw Exception('Failed to load address');
    }
  }

  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchAddress(query);
    });
  }

  Future<void> register(String name, String username, String alamat,
      String email, String telepon, String jk, String password) async {
    final data = {
      'name': name,
      'username': username,
      'no_telepon': telepon,
      'alamat': alamat,
      'jenis_kelamin': jk,
      'email': email,
      'password': password,
    };

    try {
      final response =
          await http.post(Uri.parse(Api.registerCostumer), body: data);
      final jsonResponse = jsonDecode(response.body);
      final errorMessage = jsonResponse['data'];
      print(errorMessage);
      if (errorMessage ==
          'Selamat anda berhasil registrasi, Silahkan Cek Email Anda untuk aktivasi akun') {
        Get.snackbar(
          'Registrasi Berhasil',
          'Silahkan Cek Email Anda untuk aktivasi akun',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          duration: Duration(seconds: 3),
        );

        await Future.delayed(Duration(seconds: 2));

        Get.offAllNamed("/login");
      } else {
        Get.snackbar(
          'Registrasi Berhasil ',
          'Silahkan Buat Laporan Ke Pihak Admin Untuk memvalidasi email anda',
          snackPosition: SnackPosition.TOP, // Menampilkan Snackbar dari atas
          backgroundColor: Colors.white, // Menampilkan Snackbar dari atas
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Registrasi Gagal',
        'Eror Saat Registrasi $e',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );

      throw Exception('Registration failed: $e');
    }
  }
}

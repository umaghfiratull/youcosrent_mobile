import 'dart:convert';

import 'package:cosplay_rental/app/data/apiconfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final RxString email = ''.obs; // Objek reaktif untuk token
  final RxString phone = ''.obs;
  final RxString name = ''.obs;
  final RxString address = ''.obs;
  final TextEditingController editName = TextEditingController();
  final TextEditingController editEmail = TextEditingController();
  final TextEditingController editNoHp = TextEditingController();
  var isLoading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadSharedPreferencesData(); // Muat data saat inisialisasi
  }

  void loadSharedPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString('email') ?? 'Tidak Ada email';
    phone.value = prefs.getString('phone') ?? 'Tidak Ada phone';
    name.value = prefs.getString('name') ?? 'Tidak Ada name';
    address.value = prefs.getString('address') ?? 'Tidak Ada address';
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

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    await prefs.remove('token');
    await prefs.remove('cartItems_$token');

    Get.offAllNamed('/login');
  }

  Future<dynamic> showlogout(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Lottie.asset(
                //   "assets/Animation_logout.json", // Ganti dengan nama file Lottie Anda
                //   width: 100.0,
                //   height: 100.0,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Anda Akan Logout ?",
                    style: TextStyle(
                      color: Color(0xff3CA2D9),
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Ya'),
                    onPressed: () {
                      logout();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    child: Text('Tidak'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future<void> updatePhoneNumber(String newPhoneNumber) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse(Api.editProfile); // Replace with your API endpoint

    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'no_telfon': newPhoneNumber}),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      phone.value = newPhoneNumber;
      editNoHp.text = "";
      Get.snackbar('Success', 'Phone number updated successfully');
    } else {
      Get.snackbar('Error', 'Failed to update phone number');
    }
  }

  Future<void> updateEmail(String newEmail) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse(Api.editProfile); // Replace with your API endpoint

    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'email': newEmail}),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      email.value = newEmail;
      editEmail.text = "";
      Get.snackbar('Success', 'Email updated successfully');
    } else {
      Get.snackbar('Error', 'Failed to update Email');
    }
  }

  Future<void> updateName(String newName) async {
    isLoading.value = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url = Uri.parse(Api.editProfile); // Replace with your API endpoint

    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'nama': newName}),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      name.value = newName;
      editName.text = "";
      Get.snackbar('Success', 'Nama updated successfully');
    } else {
      Get.snackbar('Error', 'Failed to update Nama');
    }
  }
}

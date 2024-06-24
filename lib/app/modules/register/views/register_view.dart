import 'package:cosplay_rental/utils/collor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final RegisterController c = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        // physics: (),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.8, // Ukuran penuh
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Pusatkan secara vertikal
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Register",
                      style: GoogleFonts.sourceSans3(
                        textStyle: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.blue,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          controller: c.nameController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 3,
                                )),
                            hintText: 'Masukkan nama anda',
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25.0,
                              color: Color(0xFF0067A5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          controller: c.usernameController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 3,
                                )),
                            hintText: 'Masukkan username',
                            prefixIcon: Icon(
                              Icons.person,
                              size: 25.0,
                              color: Color(0xFF0067A5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          controller: c.emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 3,
                                )),
                            hintText: 'example@gmail.com',
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              size: 25.0,
                              color: Color(0xFF0067A5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => DropdownButtonFormField<String>(
                            value: c.gender.value,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 3,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 25.0,
                                color: Color(0xFF0067A5),
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'L',
                                child: Text('Laki-laki'),
                              ),
                              DropdownMenuItem(
                                value: 'P',
                                child: Text('Perempuan'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                c.gender.value = value;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          onChanged: c.onSearchChanged,
                          controller: c.addressController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 3,
                                )),
                            hintText: 'Ketik alamat anda',
                            prefixIcon: Icon(
                              Icons.place,
                              size: 25.0,
                              color: Color(0xFF0067A5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Obx(() => Visibility(
                              visible: controller.isSearching.value &&
                                  controller.searchResults.isNotEmpty,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListView.builder(
                                  itemCount: controller.searchResults.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title:
                                          Text(controller.searchResults[index]),
                                      onTap: () {
                                        controller.addressController.text =
                                            controller.searchResults[index];
                                        controller.isSearching.value =
                                            false; // Hide after selection
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                    );
                                  },
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          controller: c.phoneController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 3,
                                )),
                            hintText: 'Masukkan Nomor telepon ',
                            prefixIcon: Icon(
                              Icons.call,
                              size: 25.0,
                              color: Color(0xFF0067A5),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => TextField(
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            controller: c.passwordController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Colors.greenAccent,
                                      width: 3,
                                    )),
                                hintText: 'Masukkan password anda',
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    c.toggleObscureText();
                                  },
                                  icon: c.obscureText.value
                                      ? Icon(
                                          Icons.lock_outline_rounded,
                                          size: 25.0,
                                          color: Colors.blue,
                                        )
                                      : Icon(
                                          Icons.lock_open_rounded,
                                          size: 25.0,
                                          color: Colors.blue,
                                        ),
                                )),
                            obscureText: c.obscureText.value,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => TextField(
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            controller: c.confirmpasswordController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    borderSide: BorderSide(
                                      color: Colors.greenAccent,
                                      width: 3,
                                    )),
                                hintText: 'Konfirmasi password anda',
                                prefixIcon: IconButton(
                                  onPressed: () {
                                    c.toggleObscureText2();
                                  },
                                  icon: c.obscureText2.value
                                      ? Icon(
                                          Icons.lock_outline_rounded,
                                          size: 25.0,
                                          color: Colors.blue,
                                        )
                                      : Icon(
                                          Icons.lock_open_rounded,
                                          size: 25.0,
                                          color: Colors.blue,
                                        ),
                                )),
                            obscureText: c.obscureText2.value,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColor.buttonColor,
                                side: const BorderSide(
                                  width: 2.0,
                                  color: AppColor.buttonColor,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              onPressed: () async {
                                await c.register(
                                    c.nameController.text,
                                    c.usernameController.text,
                                    c.addressController.text,
                                    c.emailController.text,
                                    c.phoneController.text,
                                    c.gender.value,
                                    c.passwordController.text);
                                Get.toNamed('/login');
                              },
                              child: Text("Register",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: AppColor.buttonColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cosplay_rental/utils/collor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height:
                    MediaQuery.of(context).size.height / 2.8, // Ukuran penuh
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan secara vertikal
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("LOGIN",
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  child: Container(
                    decoration: const BoxDecoration(
                        // color: Colors.blue,
                        ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
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
                              hintText: 'admin@email.com',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 25.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Obx(() {
                            return TextField(
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
                            );
                          }),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                onPressed: () async {
                                  // Get.offAllNamed('/navigation');
                                  c.login(c.emailController.text,
                                      c.passwordController.text);
                                },
                                child: Text("Login",
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: 'Belum punya akun? ',
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Daftar disini',
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Center(
                            child: Text(
                              "Atau login dengan",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Center(
                            child: Image.asset(
                              "assets/google.png",
                              width: 30.0,
                              height: 30.0,
                              fit: BoxFit.fill,
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
      ),
    );
  }
}

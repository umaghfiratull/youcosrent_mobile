import 'package:cosplay_rental/app/modules/history/views/history_view.dart';
import 'package:cosplay_rental/utils/collor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Font Weight untuk yang terpilih
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: const BoxDecoration(
                //   color: Colors.blue,
                // ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  title: Text(profileController.name.value),
                  subtitle: Text(profileController.email.value),
                  trailing: IconButton(
                    onPressed: () {
                      Get.toNamed('/setting');
                    },
                    icon: const Icon(
                      Icons.settings,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Order Saya',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight:
                        FontWeight.bold, // Font Weight untuk yang terpilih
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => HistoryView());
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2.14,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, // Warna shadow
                            spreadRadius: 0, // Lebar shadow
                            blurRadius: 4, // Kekaburan shadow
                            offset: Offset(0, 2), // Posisi shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              size: 30.0,
                            ),
                            Text(
                              'Sewa',
                              style: GoogleFonts.aBeeZee(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight
                                      .bold, // Font Weight untuk yang terpilih
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2.14,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Warna shadow
                          spreadRadius: 0, // Lebar shadow
                          blurRadius: 4, // Kekaburan shadow
                          offset: Offset(0, 2), // Posisi shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            size: 30.0,
                          ),
                          Text(
                            'DreamCLoset \n Member',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight
                                    .bold, // Font Weight untuk yang terpilih
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  title: Text(
                    'Kartu Identitas',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_outlined,
                    size: 24.0,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.help_sharp,
                    size: 24.0,
                  ),
                  title: Text(
                    'Help',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight:
                            FontWeight.bold, // Font Weight untuk yang terpilih
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_outlined,
                    size: 24.0,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.wechat_sharp,
                    size: 24.0,
                  ),
                  title: Text(
                    'Chat With Us',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight:
                            FontWeight.bold, // Font Weight untuk yang terpilih
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_outlined,
                    size: 24.0,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.warning_rounded,
                    size: 24.0,
                  ),
                  title: Text(
                    'About me',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight:
                            FontWeight.bold, // Font Weight untuk yang terpilih
                      ),
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_outlined,
                    size: 24.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Divider(),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                child: ListTile(
                  onTap: () {
                    profileController.showlogout(context);
                  },
                  leading: Icon(
                    Icons.logout,
                    size: 24.0,
                  ),
                  title: Text(
                    'Log Out',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight:
                            FontWeight.bold, // Font Weight untuk yang terpilih
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

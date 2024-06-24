import 'package:cosplay_rental/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  InfoView({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Info Saya',
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
      body: Column(
        children: [
          Divider(),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
            ),
            title: Text("Update Profile Picture"),
            trailing: Icon(
              Icons.arrow_forward_outlined,
              size: 24.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Divider(),
          InkWell(
            onTap: () {
              // Get.dialog(profileController.alernEditProfile());

              Get.dialog(AlertDialog(
                title: Text('Update Name'),
                content: TextField(
                  controller: profileController.editName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(hintText: "Enter new name"),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      profileController
                          .updateName(profileController.editName.text);
                      Get.back();
                    },
                    child: Text('Update'),
                  ),
                ],
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Nama',
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight
                              .bold, // Font Weight untuk yang terpilih
                        ),
                      ),
                    ),
                    Spacer(),
                    Obx(
                      () => Text(
                        "${profileController.name.value}",
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight
                                .bold, // Font Weight untuk yang terpilih
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Get.dialog(profileController.UpdatePhoneNumberDialog());

              Get.dialog(AlertDialog(
                title: Text('Update Email'),
                content: TextField(
                  controller: profileController.editEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "Enter new Email"),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      profileController
                          .updateEmail(profileController.editEmail.text);
                      Get.back();
                    },
                    child: Text('Update'),
                  ),
                ],
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight
                              .bold, // Font Weight untuk yang terpilih
                        ),
                      ),
                    ),
                    Spacer(),
                    Obx(
                      () => Text(
                        "${profileController.email.value}",
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight
                                .bold, // Font Weight untuk yang terpilih
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Get.dialog(profileController.UpdatePhoneNumberDialog());

              Get.dialog(AlertDialog(
                title: Text('Update Phone Number'),
                content: TextField(
                  controller: profileController.editNoHp,
                  keyboardType: TextInputType.phone,
                  decoration:
                      InputDecoration(hintText: "Enter new phone number"),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      profileController
                          .updatePhoneNumber(profileController.editNoHp.text);
                      Get.back();
                    },
                    child: Text('Update'),
                  ),
                ],
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'Nomor Telepon',
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Obx(
                      () => Text(
                        "${profileController.phone.value}",
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(
                      Icons.arrow_forward_outlined,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

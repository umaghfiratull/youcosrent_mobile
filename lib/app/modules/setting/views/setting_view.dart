import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
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
          Container(
            child: ListTile(
              onTap: (){
                Get.toNamed('/info');
              },
              leading: Icon(
                Icons.person,
                size: 24.0,
              ),
              title: Text(
                'Info Saya',
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
                onTap: (){
                Get.toNamed('/address');
              },
              leading: Icon(
                Icons.home,
                size: 24.0,
              ),
              title: Text(
                'Alamat ',
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
        ],
      ),
    );
  }
}

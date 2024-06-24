import 'package:cosplay_rental/app/modules/home/views/aksesoris.dart';
import 'package:cosplay_rental/app/modules/home/views/terlaris.dart';
import 'package:cosplay_rental/app/modules/sewa/controllers/dreamcloset.dart';
import 'package:cosplay_rental/app/modules/sewa/controllers/ontime.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/sewa_controller.dart';

class SewaView extends GetView<SewaController> {
  SewaView({Key? key}) : super(key: key);
  final SewaController sewaController = Get.put(SewaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YouCosRent',
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Font Weight untuk yang terpilih
            ),
          ),
        ),
        centerTitle: false,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          controller: sewaController.tabController,
          labelStyle: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold, // Font Weight untuk yang terpilih
            ),
          ),
          unselectedLabelStyle: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight:
                  FontWeight.normal, // Font Weight untuk yang tidak terpilih
            ),
          ),
          tabs: [
            Tab(text: "ONE-TIME RENTAL"),
            Tab(text: "DREAMCLOSET"),
          ],
        ),
      ),
      body: TabBarView(
        controller: sewaController.tabController,
        children: [
          Ontime(context),
          DreamCloset(context),
        ],
        
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Hasil Pencarian untuk "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Tampilkan saran berdasarkan query
    return Container(
      child: Aksesoris(context),
    );
  }
}

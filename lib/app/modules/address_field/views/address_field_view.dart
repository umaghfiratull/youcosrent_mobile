import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:get/get.dart';

import '../../../../utils/collor.dart';
import '../controllers/address_field_controller.dart';

class AddressFieldView extends GetView<AddressFieldController> {
  AddressFieldView({Key? key}) : super(key: key);
  final AddressFieldController controller = Get.put(AddressFieldController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 20,
        title: Text(
          "YouCosRent",
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Nama",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Justin Huibner',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 126, 70, 70)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Nomor Telepon",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: '083456567654',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 126, 70, 70)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Alamat",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              TextField(
                onChanged: controller.onSearchChanged,
                controller: controller.controller,
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Alamat',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 126, 70, 70)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
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
                            title: Text(controller.searchResults[index]),
                            onTap: () {
                              controller.controller.text =
                                  controller.searchResults[index];
                              controller.isSearching.value =
                                  false; // Hide after selection
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          );
                        },
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Detail Alamat",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Gang Paus',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(255, 126, 70, 70)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: FloatingActionButton(
                backgroundColor: AppColor.buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(color: Colors.grey)),
                // color: Color(0xfff26d71),
                onPressed: () async {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Simpan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchAddressView extends StatefulWidget {
  @override
  _SearchAddressViewState createState() => _SearchAddressViewState();
}

class _SearchAddressViewState extends State<SearchAddressView> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  List<String> _searchResults = [];

  Future<void> searchAddress(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }

    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json');
    final response = await http.get(url,
        headers: {'User-Agent': 'YourAppName/1.0 (ContactEmail@example.com)'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      setState(() {
        _searchResults = data.map((e) => e['display_name'] as String).toList();
      });
    } else {
      throw Exception('Failed to load address');
    }
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchAddress(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Address with OSM"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter an address'),
              onChanged: _onSearchChanged,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_searchResults[index]),
                    onTap: () {
                      // Set text to TextField when user taps on a suggestion
                      _controller.text = _searchResults[index];
                      // Optionally, also close the list or perform other actions
                      FocusScope.of(context)
                          .requestFocus(FocusNode()); // Close keyboard
                      setState(() {
                        _searchResults =
                            []; // Clear search results to close the list
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

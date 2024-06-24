import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class AddressFieldController extends GetxController {
  //TODO: Implement AddressFieldController
  final TextEditingController controller = TextEditingController();
  RxList<String> searchResults = <String>[].obs;
  RxBool isSearching = false.obs; // Observable to control visibility
  Timer? _debounce;
  final count = 0.obs;
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
    _debounce?.cancel();

    super.onClose();
  }

  void increment() => count.value++;
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
}

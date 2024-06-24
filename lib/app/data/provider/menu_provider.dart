import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;

import '../../model/model_model.dart';
import '../apiconfig.dart';

class MenuProvider extends GetxController {
  Future<Model> fetchDataBarangOntime() async {
    final response = await http.get(
      Uri.parse(Api.ontime),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangdreamCLoset() async {
    final response = await http.get(
      Uri.parse(Api.dreamcloset),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangTerbaru() async {
    final response = await http.get(
      Uri.parse(Api.barangTerbaru),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangTerlaris() async {
    final response = await http.get(
      Uri.parse(Api.barangTerlaris),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangKostum() async {
    final response = await http.get(
      Uri.parse(Api.barangKostum),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangAksesoris() async {
    final response = await http.get(
      Uri.parse(Api.barangAksesoris),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangProperti() async {
    final response = await http.get(
      Uri.parse(Api.barangProperti),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  Future<Model> fetchDataBarangSepatu() async {
    final response = await http.get(
      Uri.parse(Api.barangSepatu),
    );

    if (response.statusCode == 200) {
      return Model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memuat data');
    }
  }
}

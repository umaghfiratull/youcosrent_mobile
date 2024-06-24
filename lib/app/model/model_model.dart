import 'package:get/get.dart';

class Model {
  List<Data>? data;
  int? code;
  bool? status;

  Model({this.data, this.code, this.status});

  Model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    if (data != null) {
      jsonData['data'] = data?.map((v) => v.toJson()).toList();
    }
    jsonData['code'] = code;
    jsonData['status'] = status;
    return jsonData;
  }
}

class Data {
  int? id;
  String? namaBarang;
  String? deskripsi;
  int? idJenis;
  String? jenisbarang;
  String? createdAt;
  String? updatedAt;
  List<Detailbarang>? detailbarang;
  List<DetailFoto>? detailfoto; // List of DetailFoto objects
  RxBool isFavorite = false.obs; // Add RxBool for tracking favorite state

  Data({
    this.id,
    this.namaBarang,
    this.deskripsi,
    this.idJenis,
    this.jenisbarang,
    this.createdAt,
    this.updatedAt,
    this.detailbarang,
    this.detailfoto,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBarang = json['nama_barang'];
    deskripsi = json['deskripsi'];
    idJenis = json['id_jenis'];
    jenisbarang = json['jenisbarang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['detailbarang'] != null) {
      detailbarang = <Detailbarang>[];
      json['detailbarang'].forEach((v) {
        detailbarang?.add(Detailbarang.fromJson(v));
      });
    }
    if (json['detailfoto'] != null) {
      detailfoto = <DetailFoto>[];
      json['detailfoto'].forEach((v) {
        detailfoto?.add(DetailFoto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['id'] = id;
    jsonData['nama_barang'] = namaBarang;
    jsonData['deskripsi'] = deskripsi;
    jsonData['id_jenis'] = idJenis;
    jsonData['jenisbarang'] = jenisbarang;
    jsonData['created_at'] = createdAt;
    jsonData['updated_at'] = updatedAt;
    if (detailbarang != null) {
      jsonData['detailbarang'] = detailbarang?.map((v) => v.toJson()).toList();
    }
    if (detailfoto != null) {
      jsonData['detailfoto'] = detailfoto?.map((v) => v.toJson()).toList();
    }
    return jsonData;
  }
}

class Detailbarang {
  int? id;
  String? ukuran;
  String? warna;
  int? harga;
  int? stok;
  int? idBarang;
  String? createdAt;
  String? updatedAt;

  Detailbarang(
      {this.id,
      this.ukuran,
      this.warna,
      this.harga,
      this.stok,
      this.idBarang,
      this.createdAt,
      this.updatedAt});

  Detailbarang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ukuran = json['ukuran'];
    warna = json['warna'];
    harga = json['harga'];
    stok = json['stok'];
    idBarang = json['id_barang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['id'] = id;
    jsonData['ukuran'] = ukuran;
    jsonData['warna'] = warna;
    jsonData['harga'] = harga;
    jsonData['stok'] = stok;
    jsonData['id_barang'] = idBarang;
    jsonData['created_at'] = createdAt;
    jsonData['updated_at'] = updatedAt;
    return jsonData;
  }
}

class DetailFoto {
  int? id;
  String? keterangan;
  String? foto;
  int? idBarang;
  String? createdAt;
  String? updatedAt;

  DetailFoto({
    this.id,
    this.keterangan,
    this.foto,
    this.idBarang,
    this.createdAt,
    this.updatedAt,
  });

  DetailFoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keterangan = json['keterangan'];
    foto = json['foto'];
    idBarang = json['id_barang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['id'] = id;
    jsonData['keterangan'] = keterangan;
    jsonData['foto'] = foto;
    jsonData['id_barang'] = idBarang;
    jsonData['created_at'] = createdAt;
    jsonData['updated_at'] = updatedAt;
    return jsonData;
  }
}

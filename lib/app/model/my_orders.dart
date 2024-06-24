class MyOrders {
  List<DataMyOrder>? data;
  int? code;
  bool? status;

  MyOrders({this.data, this.code, this.status});

  MyOrders.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataMyOrder>[];
      json['data'].forEach((v) {
        data?.add(DataMyOrder.fromJson(v));
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

class DataMyOrder {
  int? id;
  int? idUser;
  int? idPelanggan;
  String? tanggalSewa;
  String? tanggalAkhir;
  String? tanggalKembali;
  int? durasi;
  int? bayar;
  int? kurangBayar;
  int? totalHarga;
  int? totalDenda;
  String? statusPengembalian;
  String? statusKonfirmasi;
  String? modelBayar;
  String? buktiBayar;
  int? totalOngkir;
  String? createdAt;
  String? updatedAt;
  List<DetailTransaksi>? detailTransaksi;

  DataMyOrder({
    this.id,
    this.idUser,
    this.idPelanggan,
    this.tanggalSewa,
    this.tanggalAkhir,
    this.tanggalKembali,
    this.durasi,
    this.bayar,
    this.kurangBayar,
    this.totalHarga,
    this.totalDenda,
    this.statusPengembalian,
    this.statusKonfirmasi,
    this.modelBayar,
    this.buktiBayar,
    this.totalOngkir,
    this.createdAt,
    this.updatedAt,
    this.detailTransaksi,
  });

  DataMyOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    idPelanggan = json['id_pelanggan'];
    tanggalSewa = json['tanggal_sewa'];
    tanggalAkhir = json['tanggal_akhir'];
    tanggalKembali = json['tanggal_kembali'];
    durasi = json['durasi'];
    bayar = json['bayar'];
    kurangBayar = json['kurang_bayar'];
    totalHarga = json['total_harga'];
    totalDenda = json['total_denda'];
    statusPengembalian = json['status_pengembalian'];
    statusKonfirmasi = json['status_konfirmasi'];
    modelBayar = json['model_bayar'];
    buktiBayar = json['bukti_bayar'];
    totalOngkir = json['total_ongkir'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['detail_transaksi'] != null) {
      detailTransaksi = <DetailTransaksi>[];
      json['detail_transaksi'].forEach((v) {
        detailTransaksi?.add(DetailTransaksi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['id'] = id;
    jsonData['id_user'] = idUser;
    jsonData['id_pelanggan'] = idPelanggan;
    jsonData['tanggal_sewa'] = tanggalSewa;
    jsonData['tanggal_akhir'] = tanggalAkhir;
    jsonData['tanggal_kembali'] = tanggalKembali;
    jsonData['durasi'] = durasi;
    jsonData['bayar'] = bayar;
    jsonData['kurang_bayar'] = kurangBayar;
    jsonData['total_harga'] = totalHarga;
    jsonData['total_denda'] = totalDenda;
    jsonData['status_pengembalian'] = statusPengembalian;
    jsonData['status_konfirmasi'] = statusKonfirmasi;
    jsonData['model_bayar'] = modelBayar;
    jsonData['bukti_bayar'] = buktiBayar;
    jsonData['total_ongkir'] = totalOngkir;
    jsonData['created_at'] = createdAt;
    jsonData['updated_at'] = updatedAt;
    if (detailTransaksi != null) {
      jsonData['detail_transaksi'] =
          detailTransaksi?.map((v) => v.toJson()).toList();
    }
    return jsonData;
  }
}

class DetailTransaksi {
  int? id;
  int? idTransaksi;
  int? idDetailBarang;
  int? qty;
  int? subtotalHarga;
  String? createdAt;
  String? updatedAt;
  Barang? barang;

  DetailTransaksi({
    this.id,
    this.idTransaksi,
    this.idDetailBarang,
    this.qty,
    this.subtotalHarga,
    this.createdAt,
    this.updatedAt,
    this.barang,
  });

  DetailTransaksi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTransaksi = json['id_transkasi'];
    idDetailBarang = json['id_detailbarang'];
    qty = json['qty'];
    subtotalHarga = json['subtotal_harga'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    barang = json['barang'] != null ? Barang.fromJson(json['barang']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['id'] = id;
    jsonData['id_transkasi'] = idTransaksi;
    jsonData['id_detailbarang'] = idDetailBarang;
    jsonData['qty'] = qty;
    jsonData['subtotal_harga'] = subtotalHarga;
    jsonData['created_at'] = createdAt;
    jsonData['updated_at'] = updatedAt;
    if (barang != null) {
      jsonData['barang'] = barang?.toJson();
    }
    return jsonData;
  }
}

class Barang {
  int? id;
  String? namaBarang;
  String? deskripsi;
  int? idJenis;
  String? createdAt;
  String? updatedAt;
  List<DetailBarang>? detailbarang;
  JenisBarang? jenisbarang;
  List<DetailFoto>? detailfoto; // List of DetailFoto objects

  Barang({
    this.id,
    this.namaBarang,
    this.deskripsi,
    this.idJenis,
    this.createdAt,
    this.updatedAt,
    this.detailbarang,
    this.jenisbarang,
    this.detailfoto,
  });

  Barang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaBarang = json['nama_barang'];
    deskripsi = json['deskripsi'];
    idJenis = json['id_jenis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['detailbarang'] != null) {
      detailbarang = <DetailBarang>[];
      json['detailbarang'].forEach((v) {
        detailbarang?.add(DetailBarang.fromJson(v));
      });
    }
    if (json['jenisbarang'] != null) {
      jenisbarang = JenisBarang.fromJson(json['jenisbarang']);
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
    jsonData['created_at'] = createdAt;
    jsonData['updated_at'] = updatedAt;
    if (detailbarang != null) {
      jsonData['detailbarang'] = detailbarang?.map((v) => v.toJson()).toList();
    }
    if (jenisbarang != null) {
      jsonData['jenisbarang'] = jenisbarang?.toJson();
    }
    if (detailfoto != null) {
      jsonData['detailfoto'] = detailfoto?.map((v) => v.toJson()).toList();
    }
    return jsonData;
  }
}

class DetailBarang {
  int? id;
  String? ukuran;
  String? warna;
  int? harga;
  int? stok;
  int? idBarang;
  String? createdAt;
  String? updatedAt;

  DetailBarang({
    this.id,
    this.ukuran,
    this.warna,
    this.harga,
    this.stok,
    this.idBarang,
    this.createdAt,
    this.updatedAt,
  });

  DetailBarang.fromJson(Map<String, dynamic> json) {
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

class JenisBarang {
  int? id;
  String? jenisbarang;
  String? createdAt;
  String? updatedAt;

  JenisBarang({
    this.id,
    this.jenisbarang,
    this.createdAt,
    this.updatedAt,
  });

  JenisBarang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisbarang = json['jenisbarang'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['id'] = id;
    jsonData['jenisbarang'] = jenisbarang;
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

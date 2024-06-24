class CartItem {
  final String name;
  final int id;
  final int harga;
  final String gambar;
  final String duration;
  final String startDate;
  final String endDate;

  CartItem({
    required this.name,
    required this.id,
    required this.harga,
    required this.gambar,
    required this.duration,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id_detailbarang': id,
      'subtotal_harga': harga,
      'gambar': gambar,
      'duration': duration,
      'startDate': "2024-05-01T00:00:00",
      'endDate': "2024-05-01T00:00:00",
      "qty": 1,
    };
  }
}

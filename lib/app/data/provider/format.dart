import 'package:intl/intl.dart';

extension IntExtensions on int {
  String toRupiah() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = "Rp ${formatCurrency.format(this).substring(3)}";

    return formattedCurrency.substring(0, formattedCurrency.indexOf(','));
  }
}

extension DoubleExtensions on double {
  String toRupiahDouble() {
    final formatCurrency = NumberFormat.currency(locale: "id-ID");
    String formattedCurrency = "Rp ${formatCurrency.format(this).substring(3)}";

    return formattedCurrency.substring(0, formattedCurrency.indexOf(','));
  }
}

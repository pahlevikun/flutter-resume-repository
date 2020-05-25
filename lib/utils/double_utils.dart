import 'package:intl/intl.dart';

class DoubleUtils {
  static String formatRupiah(int _numberData) {
    if (_numberData == null) {
      return "";
    } else {
      String rupiah = "Rp. ";
      final numberFormat = new NumberFormat("#,###.##", "en_US");
      String result = numberFormat.format(_numberData);

      return rupiah + result;
    }
  }
}

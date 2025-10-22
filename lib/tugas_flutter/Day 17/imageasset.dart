import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class AppImage {
  static const AssetImage = "assets/images";
  static const Pulpen = "$AssetImage/pen.png";
  static const Pensil = "$AssetImage/pencil.png";
  static const Penghapus = "$AssetImage/eraser.png";
  static const Buku = "$AssetImage/book.png";
  static const PaperClip = "$AssetImage/paper clip.jpg";
  static const Kalkulator = "$AssetImage/eraser.png";
  static const Penggaris = "$AssetImage/book.png";
  static const mapfolder = "$AssetImage/mapfolder.png";
  static const Gunting = "$AssetImage/gunting.jpg";
  static const Cutter = "$AssetImage/cutter.png";
}

extension CurrencyFormatter on String {
  String toRPCurrency() {
    final number = int.tryParse(this);
    if(number != null) {
      final formatter = NumberFormat.currency(locale: "id_IDR", symbol: "Rp");
      return formatter.format(number).replaceAll(RegExp(r',00$'), "");
    }
    return this;
  }
}

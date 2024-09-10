import 'package:tcddbiletfinding/data/model/vagon_koltuk.dart';

class KoltukListesi {
  String? saat;
  List<KoltukDurum> koltuklistesi = [];

  KoltukListesi({this.saat, required this.koltuklistesi});
}
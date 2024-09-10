// To parse this JSON data, do
//
//     final tcdd = tcddFromJson(jsonString);

import 'dart:convert';

Tcdd tcddFromJson(String str) => Tcdd.fromJson(json.decode(str));

String tcddToJson(Tcdd data) => json.encode(data.toJson());

class Tcdd {
  CevapBilgileri cevapBilgileri;
  dynamic sayi;
  List<SeferSorgulamaSonucList> seferSorgulamaSonucList;

  Tcdd({
    required this.cevapBilgileri,
    required this.sayi,
    required this.seferSorgulamaSonucList,
  });

  Tcdd copyWith({
    CevapBilgileri? cevapBilgileri,
    dynamic sayi,
    List<SeferSorgulamaSonucList>? seferSorgulamaSonucList,
  }) =>
      Tcdd(
        cevapBilgileri: cevapBilgileri ?? this.cevapBilgileri,
        sayi: sayi ?? this.sayi,
        seferSorgulamaSonucList:
            seferSorgulamaSonucList ?? this.seferSorgulamaSonucList,
      );

  factory Tcdd.fromJson(Map<String, dynamic> json) => Tcdd(
        cevapBilgileri: CevapBilgileri.fromJson(json["cevapBilgileri"]),
        sayi: json["sayi"],
        seferSorgulamaSonucList: List<SeferSorgulamaSonucList>.from(
            json["seferSorgulamaSonucList"]
                .map((x) => SeferSorgulamaSonucList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cevapBilgileri": cevapBilgileri.toJson(),
        "sayi": sayi,
        "seferSorgulamaSonucList":
            List<dynamic>.from(seferSorgulamaSonucList.map((x) => x.toJson())),
      };
}

class CevapBilgileri {
  String cevapKodu;
  String cevapMsj;
  dynamic detay;

  CevapBilgileri({
    required this.cevapKodu,
    required this.cevapMsj,
    required this.detay,
  });

  CevapBilgileri copyWith({
    String? cevapKodu,
    String? cevapMsj,
    dynamic detay,
  }) =>
      CevapBilgileri(
        cevapKodu: cevapKodu ?? this.cevapKodu,
        cevapMsj: cevapMsj ?? this.cevapMsj,
        detay: detay ?? this.detay,
      );

  factory CevapBilgileri.fromJson(Map<String, dynamic> json) => CevapBilgileri(
        cevapKodu: json["cevapKodu"],
        cevapMsj: json["cevapMsj"],
        detay: json["detay"],
      );

  Map<String, dynamic> toJson() => {
        "cevapKodu": cevapKodu,
        "cevapMsj": cevapMsj,
        "detay": detay,
      };
}

class SeferSorgulamaSonucList {
  int aktarmaNo;
  int aktarmaSiraNo;
  int seyahatTuru;
  int trenId;
  String trenAdi;
  String trenTipi;
  String trenKodu;
  int trenTuruTktId;
  String seferAdi;
  int seferId;
  String binisTarih;
  String inisTarih;
  List<VagonTipleriBosYerUcret> vagonTipleriBosYerUcret;
  int satisDurum;
  int rezDurum;
  String binisIstasyonu;
  String inisIstasyonu;
  SeferGosterimDvo seferGosterimDvo;
  int vagonHaritasindanKoltukSecimi;
  int rezUcretOrani;
  int rezUcretTutari;
  bool bolgeselTren;
  int binisIstasyonId;
  int inisIstasyonId;
  List<VagonListesi> seferVagonListesi;
  bool hesapliBiletIade;
  bool hesapliBiletDegisiklik;
  bool standartBiletIade;
  bool standartBiletDegisiklik;
  bool esnekBiletIade;
  bool esnekBiletDegisiklik;
  bool tersTren;
  int minimumTasimaUcreti;
  String gunNotu;
  bool hesapliBiletAcigaCevirme;
  bool standartBiletAcigaCevirme;
  bool esnekBiletAcigaCevirme;
  int hesapliBiletDegisiklikHakki;
  int standartBiletDegisiklikHakki;
  int esnekBiletDegisiklikHakki;
  bool captcha;
  dynamic durusTablosu;
  dynamic iliskiTipi;
  dynamic kirilimOrtakVagonlarDvOs;
  dynamic bolgeselTrenKalanBiletSayisi;

  SeferSorgulamaSonucList({
    required this.aktarmaNo,
    required this.aktarmaSiraNo,
    required this.seyahatTuru,
    required this.trenId,
    required this.trenAdi,
    required this.trenTipi,
    required this.trenKodu,
    required this.trenTuruTktId,
    required this.seferAdi,
    required this.seferId,
    required this.binisTarih,
    required this.inisTarih,
    required this.vagonTipleriBosYerUcret,
    required this.satisDurum,
    required this.rezDurum,
    required this.binisIstasyonu,
    required this.inisIstasyonu,
    required this.seferGosterimDvo,
    required this.vagonHaritasindanKoltukSecimi,
    required this.rezUcretOrani,
    required this.rezUcretTutari,
    required this.bolgeselTren,
    required this.binisIstasyonId,
    required this.inisIstasyonId,
    required this.seferVagonListesi,
    required this.hesapliBiletIade,
    required this.hesapliBiletDegisiklik,
    required this.standartBiletIade,
    required this.standartBiletDegisiklik,
    required this.esnekBiletIade,
    required this.esnekBiletDegisiklik,
    required this.tersTren,
    required this.minimumTasimaUcreti,
    required this.gunNotu,
    required this.hesapliBiletAcigaCevirme,
    required this.standartBiletAcigaCevirme,
    required this.esnekBiletAcigaCevirme,
    required this.hesapliBiletDegisiklikHakki,
    required this.standartBiletDegisiklikHakki,
    required this.esnekBiletDegisiklikHakki,
    required this.captcha,
    required this.durusTablosu,
    required this.iliskiTipi,
    required this.kirilimOrtakVagonlarDvOs,
    required this.bolgeselTrenKalanBiletSayisi,
  });

  SeferSorgulamaSonucList copyWith({
    int? aktarmaNo,
    int? aktarmaSiraNo,
    int? seyahatTuru,
    int? trenId,
    String? trenAdi,
    String? trenTipi,
    String? trenKodu,
    int? trenTuruTktId,
    String? seferAdi,
    int? seferId,
    String? binisTarih,
    String? inisTarih,
    List<VagonTipleriBosYerUcret>? vagonTipleriBosYerUcret,
    int? satisDurum,
    int? rezDurum,
    String? binisIstasyonu,
    String? inisIstasyonu,
    SeferGosterimDvo? seferGosterimDvo,
    int? vagonHaritasindanKoltukSecimi,
    int? rezUcretOrani,
    int? rezUcretTutari,
    bool? bolgeselTren,
    int? binisIstasyonId,
    int? inisIstasyonId,
    List<VagonListesi>? seferVagonListesi,
    bool? hesapliBiletIade,
    bool? hesapliBiletDegisiklik,
    bool? standartBiletIade,
    bool? standartBiletDegisiklik,
    bool? esnekBiletIade,
    bool? esnekBiletDegisiklik,
    bool? tersTren,
    int? minimumTasimaUcreti,
    String? gunNotu,
    bool? hesapliBiletAcigaCevirme,
    bool? standartBiletAcigaCevirme,
    bool? esnekBiletAcigaCevirme,
    int? hesapliBiletDegisiklikHakki,
    int? standartBiletDegisiklikHakki,
    int? esnekBiletDegisiklikHakki,
    bool? captcha,
    dynamic durusTablosu,
    dynamic iliskiTipi,
    dynamic kirilimOrtakVagonlarDvOs,
    dynamic bolgeselTrenKalanBiletSayisi,
  }) =>
      SeferSorgulamaSonucList(
        aktarmaNo: aktarmaNo ?? this.aktarmaNo,
        aktarmaSiraNo: aktarmaSiraNo ?? this.aktarmaSiraNo,
        seyahatTuru: seyahatTuru ?? this.seyahatTuru,
        trenId: trenId ?? this.trenId,
        trenAdi: trenAdi ?? this.trenAdi,
        trenTipi: trenTipi ?? this.trenTipi,
        trenKodu: trenKodu ?? this.trenKodu,
        trenTuruTktId: trenTuruTktId ?? this.trenTuruTktId,
        seferAdi: seferAdi ?? this.seferAdi,
        seferId: seferId ?? this.seferId,
        binisTarih: binisTarih ?? this.binisTarih,
        inisTarih: inisTarih ?? this.inisTarih,
        vagonTipleriBosYerUcret:
            vagonTipleriBosYerUcret ?? this.vagonTipleriBosYerUcret,
        satisDurum: satisDurum ?? this.satisDurum,
        rezDurum: rezDurum ?? this.rezDurum,
        binisIstasyonu: binisIstasyonu ?? this.binisIstasyonu,
        inisIstasyonu: inisIstasyonu ?? this.inisIstasyonu,
        seferGosterimDvo: seferGosterimDvo ?? this.seferGosterimDvo,
        vagonHaritasindanKoltukSecimi:
            vagonHaritasindanKoltukSecimi ?? this.vagonHaritasindanKoltukSecimi,
        rezUcretOrani: rezUcretOrani ?? this.rezUcretOrani,
        rezUcretTutari: rezUcretTutari ?? this.rezUcretTutari,
        bolgeselTren: bolgeselTren ?? this.bolgeselTren,
        binisIstasyonId: binisIstasyonId ?? this.binisIstasyonId,
        inisIstasyonId: inisIstasyonId ?? this.inisIstasyonId,
        seferVagonListesi: seferVagonListesi ?? this.seferVagonListesi,
        hesapliBiletIade: hesapliBiletIade ?? this.hesapliBiletIade,
        hesapliBiletDegisiklik:
            hesapliBiletDegisiklik ?? this.hesapliBiletDegisiklik,
        standartBiletIade: standartBiletIade ?? this.standartBiletIade,
        standartBiletDegisiklik:
            standartBiletDegisiklik ?? this.standartBiletDegisiklik,
        esnekBiletIade: esnekBiletIade ?? this.esnekBiletIade,
        esnekBiletDegisiklik: esnekBiletDegisiklik ?? this.esnekBiletDegisiklik,
        tersTren: tersTren ?? this.tersTren,
        minimumTasimaUcreti: minimumTasimaUcreti ?? this.minimumTasimaUcreti,
        gunNotu: gunNotu ?? this.gunNotu,
        hesapliBiletAcigaCevirme:
            hesapliBiletAcigaCevirme ?? this.hesapliBiletAcigaCevirme,
        standartBiletAcigaCevirme:
            standartBiletAcigaCevirme ?? this.standartBiletAcigaCevirme,
        esnekBiletAcigaCevirme:
            esnekBiletAcigaCevirme ?? this.esnekBiletAcigaCevirme,
        hesapliBiletDegisiklikHakki:
            hesapliBiletDegisiklikHakki ?? this.hesapliBiletDegisiklikHakki,
        standartBiletDegisiklikHakki:
            standartBiletDegisiklikHakki ?? this.standartBiletDegisiklikHakki,
        esnekBiletDegisiklikHakki:
            esnekBiletDegisiklikHakki ?? this.esnekBiletDegisiklikHakki,
        captcha: captcha ?? this.captcha,
        durusTablosu: durusTablosu ?? this.durusTablosu,
        iliskiTipi: iliskiTipi ?? this.iliskiTipi,
        kirilimOrtakVagonlarDvOs:
            kirilimOrtakVagonlarDvOs ?? this.kirilimOrtakVagonlarDvOs,
        bolgeselTrenKalanBiletSayisi:
            bolgeselTrenKalanBiletSayisi ?? this.bolgeselTrenKalanBiletSayisi,
      );

  factory SeferSorgulamaSonucList.fromJson(Map<String, dynamic> json) =>
      SeferSorgulamaSonucList(
        aktarmaNo: json["aktarmaNo"],
        aktarmaSiraNo: json["aktarmaSiraNo"],
        seyahatTuru: json["seyahatTuru"],
        trenId: json["trenId"],
        trenAdi: json["trenAdi"],
        trenTipi: json["trenTipi"],
        trenKodu: json["trenKodu"],
        trenTuruTktId: json["trenTuruTktId"],
        seferAdi: json["seferAdi"],
        seferId: json["seferId"],
        binisTarih: json["binisTarih"],
        inisTarih: json["inisTarih"],
        vagonTipleriBosYerUcret: List<VagonTipleriBosYerUcret>.from(
            json["vagonTipleriBosYerUcret"]
                .map((x) => VagonTipleriBosYerUcret.fromJson(x))),
        satisDurum: json["satisDurum"],
        rezDurum: json["rezDurum"],
        binisIstasyonu: json["binisIstasyonu"],
        inisIstasyonu: json["inisIstasyonu"],
        seferGosterimDvo: SeferGosterimDvo.fromJson(json["seferGosterimDVO"]),
        vagonHaritasindanKoltukSecimi: json["vagonHaritasindanKoltukSecimi"],
        rezUcretOrani: json["rezUcretOrani"],
        rezUcretTutari: json["rezUcretTutari"],
        bolgeselTren: json["bolgeselTren"],
        binisIstasyonId: json["binisIstasyonId"],
        inisIstasyonId: json["inisIstasyonId"],
        seferVagonListesi: List<VagonListesi>.from(
            json["seferVagonListesi"].map((x) => VagonListesi.fromJson(x))),
        hesapliBiletIade: json["hesapliBiletIade"],
        hesapliBiletDegisiklik: json["hesapliBiletDegisiklik"],
        standartBiletIade: json["standartBiletIade"],
        standartBiletDegisiklik: json["standartBiletDegisiklik"],
        esnekBiletIade: json["esnekBiletIade"],
        esnekBiletDegisiklik: json["esnekBiletDegisiklik"],
        tersTren: json["tersTren"],
        minimumTasimaUcreti: json["minimumTasimaUcreti"],
        gunNotu: json["gunNotu"],
        hesapliBiletAcigaCevirme: json["hesapliBiletAcigaCevirme"],
        standartBiletAcigaCevirme: json["standartBiletAcigaCevirme"],
        esnekBiletAcigaCevirme: json["esnekBiletAcigaCevirme"],
        hesapliBiletDegisiklikHakki: json["hesapliBiletDegisiklikHakki"],
        standartBiletDegisiklikHakki: json["standartBiletDegisiklikHakki"],
        esnekBiletDegisiklikHakki: json["esnekBiletDegisiklikHakki"],
        captcha: json["captcha"],
        durusTablosu: json["durusTablosu"],
        iliskiTipi: json["iliskiTipi"],
        kirilimOrtakVagonlarDvOs: json["kirilimOrtakVagonlarDVOs"],
        bolgeselTrenKalanBiletSayisi: json["bolgeselTrenKalanBiletSayisi"],
      );

  Map<String, dynamic> toJson() => {
        "aktarmaNo": aktarmaNo,
        "aktarmaSiraNo": aktarmaSiraNo,
        "seyahatTuru": seyahatTuru,
        "trenId": trenId,
        "trenAdi": trenAdi,
        "trenTipi": trenTipi,
        "trenKodu": trenKodu,
        "trenTuruTktId": trenTuruTktId,
        "seferAdi": seferAdi,
        "seferId": seferId,
        "binisTarih": binisTarih,
        "inisTarih": inisTarih,
        "vagonTipleriBosYerUcret":
            List<dynamic>.from(vagonTipleriBosYerUcret.map((x) => x.toJson())),
        "satisDurum": satisDurum,
        "rezDurum": rezDurum,
        "binisIstasyonu": binisIstasyonu,
        "inisIstasyonu": inisIstasyonu,
        "seferGosterimDVO": seferGosterimDvo.toJson(),
        "vagonHaritasindanKoltukSecimi": vagonHaritasindanKoltukSecimi,
        "rezUcretOrani": rezUcretOrani,
        "rezUcretTutari": rezUcretTutari,
        "bolgeselTren": bolgeselTren,
        "binisIstasyonId": binisIstasyonId,
        "inisIstasyonId": inisIstasyonId,
        "seferVagonListesi":
            List<dynamic>.from(seferVagonListesi.map((x) => x.toJson())),
        "hesapliBiletIade": hesapliBiletIade,
        "hesapliBiletDegisiklik": hesapliBiletDegisiklik,
        "standartBiletIade": standartBiletIade,
        "standartBiletDegisiklik": standartBiletDegisiklik,
        "esnekBiletIade": esnekBiletIade,
        "esnekBiletDegisiklik": esnekBiletDegisiklik,
        "tersTren": tersTren,
        "minimumTasimaUcreti": minimumTasimaUcreti,
        "gunNotu": gunNotu,
        "hesapliBiletAcigaCevirme": hesapliBiletAcigaCevirme,
        "standartBiletAcigaCevirme": standartBiletAcigaCevirme,
        "esnekBiletAcigaCevirme": esnekBiletAcigaCevirme,
        "hesapliBiletDegisiklikHakki": hesapliBiletDegisiklikHakki,
        "standartBiletDegisiklikHakki": standartBiletDegisiklikHakki,
        "esnekBiletDegisiklikHakki": esnekBiletDegisiklikHakki,
        "captcha": captcha,
        "durusTablosu": durusTablosu,
        "iliskiTipi": iliskiTipi,
        "kirilimOrtakVagonlarDVOs": kirilimOrtakVagonlarDvOs,
        "bolgeselTrenKalanBiletSayisi": bolgeselTrenKalanBiletSayisi,
      };
}

class SeferGosterimDvo {
  int seciliBiletTipi;

  SeferGosterimDvo({
    required this.seciliBiletTipi,
  });

  SeferGosterimDvo copyWith({
    int? seciliBiletTipi,
  }) =>
      SeferGosterimDvo(
        seciliBiletTipi: seciliBiletTipi ?? this.seciliBiletTipi,
      );

  factory SeferGosterimDvo.fromJson(Map<String, dynamic> json) =>
      SeferGosterimDvo(
        seciliBiletTipi: json["seciliBiletTipi"],
      );

  Map<String, dynamic> toJson() => {
        "seciliBiletTipi": seciliBiletTipi,
      };
}

class VagonListesi {
  int seferTeskilatId;
  int seferBaslikId;
  int vagonBaslikId;
  int vagonSiraNo;
  int baslangicIstasyonId;
  int bitisIstasyonId;
  bool aktif;
  String baslangicIstasyonAdi;
  String bitisIstasyonAdi;
  int bosYer;

  VagonListesi({
    required this.seferTeskilatId,
    required this.seferBaslikId,
    required this.vagonBaslikId,
    required this.vagonSiraNo,
    required this.baslangicIstasyonId,
    required this.bitisIstasyonId,
    required this.aktif,
    required this.baslangicIstasyonAdi,
    required this.bitisIstasyonAdi,
    required this.bosYer,
  });

  VagonListesi copyWith({
    int? seferTeskilatId,
    int? seferBaslikId,
    int? vagonBaslikId,
    int? vagonSiraNo,
    int? baslangicIstasyonId,
    int? bitisIstasyonId,
    bool? aktif,
    String? baslangicIstasyonAdi,
    String? bitisIstasyonAdi,
    int? bosYer,
  }) =>
      VagonListesi(
        seferTeskilatId: seferTeskilatId ?? this.seferTeskilatId,
        seferBaslikId: seferBaslikId ?? this.seferBaslikId,
        vagonBaslikId: vagonBaslikId ?? this.vagonBaslikId,
        vagonSiraNo: vagonSiraNo ?? this.vagonSiraNo,
        baslangicIstasyonId: baslangicIstasyonId ?? this.baslangicIstasyonId,
        bitisIstasyonId: bitisIstasyonId ?? this.bitisIstasyonId,
        aktif: aktif ?? this.aktif,
        baslangicIstasyonAdi: baslangicIstasyonAdi ?? this.baslangicIstasyonAdi,
        bitisIstasyonAdi: bitisIstasyonAdi ?? this.bitisIstasyonAdi,
        bosYer: bosYer ?? this.bosYer,
      );

  factory VagonListesi.fromJson(Map<String, dynamic> json) => VagonListesi(
        seferTeskilatId: json["seferTeskilatId"],
        seferBaslikId: json["seferBaslikId"],
        vagonBaslikId: json["vagonBaslikId"],
        vagonSiraNo: json["vagonSiraNo"],
        baslangicIstasyonId: json["baslangicIstasyonId"],
        bitisIstasyonId: json["bitisIstasyonId"],
        aktif: json["aktif"],
        baslangicIstasyonAdi: json["baslangicIstasyonAdi"]!,
        bitisIstasyonAdi: json["bitisIstasyonAdi"]!,
        bosYer: json["bosYer"],
      );

  Map<String, dynamic> toJson() => {
        "seferTeskilatId": seferTeskilatId,
        "seferBaslikId": seferBaslikId,
        "vagonBaslikId": vagonBaslikId,
        "vagonSiraNo": vagonSiraNo,
        "baslangicIstasyonId": baslangicIstasyonId,
        "bitisIstasyonId": bitisIstasyonId,
        "aktif": aktif,
        "baslangicIstasyonAdi": baslangicIstasyonAdi,
        "bitisIstasyonAdi": bitisIstasyonAdi,
        "bosYer": bosYer,
      };
}

class VagonTipleriBosYerUcret {
  int vagonTipId;
  String vagonTip;
  int mevkiNo;
  int kalanSayi;
  int hesapliBiletFiyati;
  int standartBiletFiyati;
  int esnekBiletFiyati;
  List<VagonListesi> vagonListesi;
  int ubsKodu;
  int gosterimArtiUcret;
  int kalanEngelliKoltukSayisi;
  int kalanYatakSayisi;

  VagonTipleriBosYerUcret({
    required this.vagonTipId,
    required this.vagonTip,
    required this.mevkiNo,
    required this.kalanSayi,
    required this.hesapliBiletFiyati,
    required this.standartBiletFiyati,
    required this.esnekBiletFiyati,
    required this.vagonListesi,
    required this.ubsKodu,
    required this.gosterimArtiUcret,
    required this.kalanEngelliKoltukSayisi,
    required this.kalanYatakSayisi,
  });

  VagonTipleriBosYerUcret copyWith({
    int? vagonTipId,
    String? vagonTip,
    int? mevkiNo,
    int? kalanSayi,
    int? hesapliBiletFiyati,
    int? standartBiletFiyati,
    int? esnekBiletFiyati,
    List<VagonListesi>? vagonListesi,
    int? ubsKodu,
    int? gosterimArtiUcret,
    int? kalanEngelliKoltukSayisi,
    int? kalanYatakSayisi,
  }) =>
      VagonTipleriBosYerUcret(
        vagonTipId: vagonTipId ?? this.vagonTipId,
        vagonTip: vagonTip ?? this.vagonTip,
        mevkiNo: mevkiNo ?? this.mevkiNo,
        kalanSayi: kalanSayi ?? this.kalanSayi,
        hesapliBiletFiyati: hesapliBiletFiyati ?? this.hesapliBiletFiyati,
        standartBiletFiyati: standartBiletFiyati ?? this.standartBiletFiyati,
        esnekBiletFiyati: esnekBiletFiyati ?? this.esnekBiletFiyati,
        vagonListesi: vagonListesi ?? this.vagonListesi,
        ubsKodu: ubsKodu ?? this.ubsKodu,
        gosterimArtiUcret: gosterimArtiUcret ?? this.gosterimArtiUcret,
        kalanEngelliKoltukSayisi:
            kalanEngelliKoltukSayisi ?? this.kalanEngelliKoltukSayisi,
        kalanYatakSayisi: kalanYatakSayisi ?? this.kalanYatakSayisi,
      );

  factory VagonTipleriBosYerUcret.fromJson(Map<String, dynamic> json) =>
      VagonTipleriBosYerUcret(
        vagonTipId: json["vagonTipId"],
        vagonTip: json["vagonTip"],
        mevkiNo: json["mevkiNo"],
        kalanSayi: json["kalanSayi"],
        hesapliBiletFiyati: json["hesapliBiletFiyati"],
        standartBiletFiyati: json["standartBiletFiyati"],
        esnekBiletFiyati: json["esnekBiletFiyati"],
        vagonListesi: List<VagonListesi>.from(
            json["vagonListesi"].map((x) => VagonListesi.fromJson(x))),
        ubsKodu: json["ubsKodu"],
        gosterimArtiUcret: json["gosterimArtiUcret"],
        kalanEngelliKoltukSayisi: json["kalanEngelliKoltukSayisi"],
        kalanYatakSayisi: json["kalanYatakSayisi"],
      );

  Map<String, dynamic> toJson() => {
        "vagonTipId": vagonTipId,
        "vagonTip": vagonTip,
        "mevkiNo": mevkiNo,
        "kalanSayi": kalanSayi,
        "hesapliBiletFiyati": hesapliBiletFiyati,
        "standartBiletFiyati": standartBiletFiyati,
        "esnekBiletFiyati": esnekBiletFiyati,
        "vagonListesi": List<dynamic>.from(vagonListesi.map((x) => x.toJson())),
        "ubsKodu": ubsKodu,
        "gosterimArtiUcret": gosterimArtiUcret,
        "kalanEngelliKoltukSayisi": kalanEngelliKoltukSayisi,
        "kalanYatakSayisi": kalanYatakSayisi,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

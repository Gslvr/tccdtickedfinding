import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {

  AppUrl();

   var stationApi = dotenv.env['STATION_LIST']!;
   static final stationBody = {
    "kanalKodu": "3",
    "dil": 1,
    "tarih": "Nov 10, 2011 12:00:00 AM",
    "satisSorgu": true
  };
////------sefer sorgula
  var seferApi = dotenv.env['SEFER_SORGU']!;
   final seferBody = {
    "kanalKodu": 3,
    "dil": 0,
    "seferSorgulamaKriterrWSDVO":{
      "satisKanali": 3,
      "binisIstasyonu": "Ankara Gar",
      "inisIstasyonu":  "Sivas" ,
      "binisIstasyonId": "stations[config.binisIstasyonAdi]",
      "inisIstasyonId": "stations[config.inisIstasyonAdi]",
      "binisIstasyonu_isHaritaGosterimi": false,
      "inisIstasyonu_isHaritaGosterimi": false,
      "seyahatTuru": 1,
      "gidisTarihi": "Nov 10, 2011 12:00:00 AM",
      "bolgeselGelsin": false,
      "islemTipi": 0,
      "yolcuSayisi": 1,
      "aktarmalarGelsin": true,
    }
  };
  ///-----vagonsorgula
  var vagonApi = dotenv.env['VAGON_SORGU']!;

  ///----apikey
  ///
   var tokenApi = dotenv.env['API_TOKEN']!;
}


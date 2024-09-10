import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tcddbiletfinding/core/constrant/degerler.dart';
import 'package:tcddbiletfinding/data/model/vagon_koltuk.dart';
import 'package:retrofit/http.dart';


abstract class Services {
  static AppUrl appUrl = AppUrl();
  static TCDDConnect tcddConnect = TCDDConnect();

  @GET('/apiPath')
  Future<List<Map<String, dynamic>>> getPosts(
      {required String url, required Map<String, dynamic> body});
}

class TCDDConnect {
  //---------------Post -----------------------------------------------
  Future<List<Map<String, dynamic>>> getStationList(
      {required String url, required Map<String, dynamic> body}) async {
    var result;
    List<Map<String, dynamic>> merkezler = [];
    try {
      final _headers = {
        'Authorization': Services.appUrl.tokenApi,
        'Content-Type': 'application/json'
      };

      result = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: _headers);
      var responsebody = utf8.decode(result.bodyBytes);
      var response = jsonDecode(responsebody);
      List istasyonListesi = response['istasyonBilgileriList'];
      for (var i = 0; i < istasyonListesi.length; i++) {
        merkezler.add({
          "istasyonId": istasyonListesi[i]['istasyonId'],
          "istasyonAdi": istasyonListesi[i]['istasyonAdi']
        });
      }
      return merkezler;
    } catch (e) {
      print(e);
    }
    return merkezler;
  }

  //---------------Date------------------------------------------------------
  Future<List<Map<String, dynamic>>> getDate(
      {required String url, required Map<String, dynamic> body}) async
  {
    var request;
    List<Map<String, dynamic>> tarihler = [];
    try {
      final _headers = {
        'Authorization': Services.appUrl.tokenApi,
        'Content-Type': 'application/json'
      };

      request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: _headers);

      var requestbody = utf8.decode(request.bodyBytes);
      var veri = jsonDecode(requestbody);
      var cevapkodu = veri['cevapBilgileri']['cevapKodu'];

      if (cevapkodu == '000') {
        List istasyonListesi = veri['seferSorgulamaSonucList'];

        istasyonListesi
            .sort((a, b) => a['binisTarih'].compareTo(b['binisTarih']));
        //print(istasyonListesi[0]);
        for (var i = 0; i < istasyonListesi.length; i++) {
          var tarih = istasyonListesi[i]['binisTarih'];


            // DateFormat ile doğru formatı belirliyoruz
            DateFormat format = DateFormat('MMM dd, yyyy hh:mm:ss a', 'en');

            // String'i DateTime'a çeviriyoruz
            DateTime dateTime = format.parse(tarih);

         // Çıktı: 2024-09-11 17:55:00.000


          String saat = dateTime.hour.toString().padLeft(2, '0') +
              ":" +
              dateTime.minute.toString().padLeft(2, '0');
          var seferId = istasyonListesi[i]['seferId'];
          List vagonListesi = istasyonListesi[i]['seferVagonListesi'];
          List<int> vagonlar = [];
          vagonListesi.forEach((e) => vagonlar.add(e['vagonSiraNo']));
          tarihler
              .add({"saat": saat, "seferId": seferId, "vagonlar": vagonlar});
        }
        return tarihler;
      } else {
        throw Exception('Api den veri alınamadı: $cevapkodu');
      }

      // print(veri["seferSorgulamaSonucList"][0]);
    } catch (e) {
      print("$e  : Hata");
    }

    return tarihler;
  }

  //---------------Vagon Sorgulama----------------------------

  Future<List<KoltukDurum>> getVagon({
    required String url,
    required Map<String, dynamic> body,
  }) async
  {
    var request;
    List<KoltukDurum> sonuclar = [];


      final _headers = {
        'Authorization': Services.appUrl.tokenApi,
        'Content-Type': 'application/json'
      };
      request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: _headers);
      var requestbody = utf8.decode(request.bodyBytes);
      var veri = jsonDecode(requestbody);
      if (veri['cevapBilgileri']['cevapKodu'] != '000' || veri == null) {
        throw Exception(
            'Api den veri alınamadı');
      } else {
        List koltuknumaralar =
            veri['vagonHaritasiIcerikDVO']['koltukDurumlari'];


        if (koltuknumaralar.isEmpty) {
          print('Koltuk durumu listesi boş.');
        } else {
          koltuknumaralar.forEach((element) {
            if (element['durum'] == 0) {

              if ((element['koltukNo'].toString().contains('h'))) {
                sonuclar.add(KoltukDurum(
                    engellikoltuk: true,
                    koltukNo: element['koltukNo'],
                    vagonSiraNo: element['vagonSiraNo']));
              } else {
                sonuclar.add(KoltukDurum(
                    engellikoltuk: false,
                    koltukNo: element['koltukNo'],
                    vagonSiraNo: element['vagonSiraNo']));
              }
            }
          });
        }

        return sonuclar;

  }
  }
  }




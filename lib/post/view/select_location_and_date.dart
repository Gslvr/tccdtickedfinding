import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tcddbiletfinding/post/block/seats_block/bloc.dart';
import 'package:tcddbiletfinding/post/view/seats_screen.dart';

import '../../core/constrant/degerler.dart';
import '../../core/widget/widget.dart';
import '../../data/model/koltuk_listesi.dart';
import '../../data/model/vagon_koltuk.dart';
import '../../data/services/services.dart';

class TCCDListesi extends StatefulWidget {
  const TCCDListesi({Key? key}) : super(key: key);

  @override
  State<TCCDListesi> createState() => _TCCDListesiState();
}

class _TCCDListesiState extends State<TCCDListesi> {
  List<Map<String, dynamic>> sehirler = [];
  List<Map<String, dynamic>> secilisehirler = [];
  List<Map<String, dynamic>> secilisehirlervaris = [];
  List<KoltukDurum> sonsonuclar = [];
  List<KoltukListesi>? koltuklistesi = [];
  List<String> selectedTimes = [];
  List<int> seferIdList = [];
  List<Map<String, dynamic>> saatler = [];
  TextEditingController? cikisSehirc;
  TextEditingController? varisSehirc;
  String cikisSehir = 'Ankara Gar';
  var cikisSehirId;
  String varisSehir = 'Sivas';
  var varisSehirId;
  DateTime harekettarih = DateTime.now();
  bool tarihgoster = false;
  final formKey = GlobalKey<FormState>();
  TCDDConnect connect = TCDDConnect();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      sehirler = await connect.getStationList(
          url: AppUrl().stationApi, body: AppUrl().seferBody);

      setState(() {});
    });
    cikisSehirc = TextEditingController();
    varisSehirc = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/img/trainstation.jpg'),
              fit: BoxFit.cover,
              opacity: 0.6)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'TCDD Bilet Arama',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Container(
          height: 50,
          padding: const EdgeInsets.only(right: 30),
          child: const Text(
            "Designed by \n"
            "GLSVR",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Colors.white, fontSize:
            12,letterSpacing: 3,leadingDistribution: TextLeadingDistribution.even),
          ),
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFieldForm(
                  controller: cikisSehirc,
                  onChange: (value) {
                    if (value.length >= 2) {
                      setState(() {
                        secilisehirler = sehirler
                            .where((element) => element['istasyonAdi']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    }

                    if (value.length >= 2 && varisSehirc!.text.length >= 2) {
                      setState(() {
                        tarihgoster = true;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    children: secilisehirler.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            cikisSehirc!.value =
                                TextEditingValue(text: e['istasyonAdi']);
                          });
                          secilisehirler.clear();
                        },
                        child: ListTile(
                          title: Text(
                            e['istasyonAdi'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                TextFieldForm(
                  controller: varisSehirc,
                  onChange: (value) {
                    if (value.length >= 2) {
                      setState(() {
                        secilisehirlervaris = sehirler
                            .where((element) => element['istasyonAdi']
                                .toString()
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    }
                    if (value.length >= 2 && cikisSehirc!.text.length >= 2) {
                      setState(() {
                        tarihgoster = true;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    children: secilisehirlervaris.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            varisSehirc!.value =
                                TextEditingValue(text: e['istasyonAdi']);
                          });
                          secilisehirlervaris.clear();
                        },
                        child: ListTile(
                          title: Text(
                            e['istasyonAdi'],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                tarihgoster
                    ? SizedBox(
                        height: 200,
                        width: 300,
                        child: CupertinoTheme(
                          data: const CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                              dateTimePickerTextStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            backgroundColor: Colors.black.withOpacity(0.4),
                            minimumDate: DateTime.now(),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 29)),
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime newDateTime) async {
                              setState(() {
                                harekettarih = newDateTime;
                              });
                            },
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 30,
                ),
                tarihgoster
                    ? FormButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            var body = {
                              "kanalKodu": 3,
                              "dil": 0,
                              "seferSorgulamaKriterWSDVO": {
                                "satisKanali": 3,
                                "binisIstasyonu": cikisSehirc!.text,
                                "inisIstasyonu": varisSehirc!.text,
                                "binisIstasyonId": cikisSehirId,
                                "inisIstasyonId": varisSehirId,
                                "binisIstasyonu_isHaritaGosterimi": false,
                                "inisIstasyonu_isHaritaGosterimi": false,
                                "seyahatTuru": 1,
                                "gidisTarih":
                                    DateFormat('MMM d, yyyy hh:mm:ss a', 'en')
                                        .format(harekettarih),
                                "bolgeselGelsin": false,
                                "islemTipi": 0,
                                "yolcuSayisi": 1,
                                "aktarmalarGelsin": true,
                              }
                            };
                            saatler = await connect.getDate(
                                url: AppUrl().seferApi, body: body);
                            if (saatler.isNotEmpty) {
                              saatler.sort(
                                  (a, b) => a['saat'].compareTo(b['saat']));
                              _showAlertDialog(context);
                            }
                            return;
                          }
                        },
                        buttonText: 'Hareket Saatleri')
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hareket Saatleri'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: 300,
                width: 300,
                child: ListView(
                  children: saatler.map((e) {
                    bool isSelected = selectedTimes.contains(e['saat']);

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time_outlined),
                        Checkbox(
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedTimes.add(e['saat']);
                              } else {
                                selectedTimes.remove(e['saat']);
                              }
                            });
                          },
                        ),
                        Text(e['saat']),
                      ],
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  selectedTimes.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'İptal',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              child: const Text(
                'Boş Koltuk Bul',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () async {
                List<Map<String, dynamic>> saatlist = saatler
                    .where((e) => selectedTimes.contains(e['saat']))
                    .toList();

                context.read<SeatsBloc>().add(SeatsListing(
                    saatlist, cikisSehirc!.text, varisSehirc!.text));

                koltuklistesi?.clear();
                sonsonuclar.clear();
                selectedTimes.clear();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SeatsScreen(
                        tarih: harekettarih))); // Ensure the dialog is
                // dismissed
              },
            ),
          ],
        );
      },
    );
  }
}

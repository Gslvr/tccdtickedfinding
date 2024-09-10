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
    return Scaffold(
      appBar: AppBar(
        title: const Text('TCDD Bilet Arama'),
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.only(right: 30),
        child: const Text(
          "Designed by "
          "GLSVR",
          textAlign: TextAlign.right,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
        ),
      ),
      body: Center(
        child: SizedBox(
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
                          title: Text(e['istasyonAdi']),
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
                          title: Text(e['istasyonAdi']),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                tarihgoster
                    ? SizedBox(
                        height: 200,
                        width: 300,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          minimumDate: DateTime.now(),
                          maximumDate: DateTime.now().add(Duration(days: 30)),
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (DateTime newDateTime) async {
                            setState(() {
                              harekettarih = newDateTime;
                            });
                          },
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
                                    DateFormat('MMM d, yyyy hh:mm:ss a','en')
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

  void _sonucdialog(BuildContext context, List<KoltukListesi>? sonuclar,
      DateTime harekettarih) {
    if (sonuclar != null && sonuclar.isNotEmpty) {
      KoltukListesi? koltuknesnesi;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Müsait Koltuklar'),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: 300,
                  width: 300,
                  child: ListView.builder(itemBuilder: (context, index) {
                    koltuknesnesi = sonuclar[index];

                    // Grouping by vagonSiraNo
                    Map<int, List<KoltukDurum>> groupedByVagon = {};
                    for (var koltuk in koltuknesnesi!.koltuklistesi) {
                      if (!groupedByVagon.containsKey(koltuk.vagonSiraNo)) {
                        groupedByVagon[koltuk.vagonSiraNo] = [];
                      }
                      groupedByVagon[koltuk.vagonSiraNo]!.add(koltuk);
                    }
                    // Sorting the groups by vagonSiraNo
                    var sortedKeys = groupedByVagon.keys.toList()..sort();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sortedKeys.map((vagonSiraNo) {
                        var koltuklar = groupedByVagon[vagonSiraNo]!;
                        // Sort koltuklar such that those with 'h' in koltukNo come first, then by koltukNo
                        koltuklar.sort((a, b) {
                          if (a.koltukNo.toString().contains('h') &&
                              !b.koltukNo.toString().contains('h')) {
                            return -1;
                          } else if (!a.koltukNo.toString().contains('h') &&
                              b.koltukNo.toString().contains('h')) {
                            return 1;
                          } else {
                            // Compare as numbers, treating single-digit numbers as smaller
                            int aNum = int.tryParse(a.koltukNo.toString()) ?? 0;
                            int bNum = int.tryParse(b.koltukNo.toString()) ?? 0;
                            return aNum.compareTo(bNum);
                          }
                        });
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Vagon No: $vagonSiraNo',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.blueGrey)),
                            Text('Seçilen Saat: ${koltuknesnesi!.saat}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.blueGrey)),
                            const Divider(height: 5),
                            ...koltuklar.map((koltuk) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Koltuk No: ${koltuk.koltukNo}',
                                      textAlign: TextAlign.center),
                                  koltuk.koltukNo.toString().contains('h')
                                      ? const Icon(Icons.accessible,
                                          color: Colors.blue)
                                      : const Icon(Icons.person,
                                          color: Colors.blueGrey),
                                ],
                              );
                            }).toList(),
                            const Divider(height: 5),
                          ],
                        );
                      }).toList(),
                    );
                  }),
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Müsait Koltuklar'),
            content: const Text('Müsait koltuk bulunamadı'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

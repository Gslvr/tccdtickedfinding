import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'core/di/di.dart';
import 'myApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "Assets/.env");
  await configureDependencies();
  await initializeDateFormatting('tr_TR', null); // Initialize Turkish locale
  Intl.defaultLocale = 'tr_TR';
  runApp(const MyApp());
}



/*
* ListView(
                  children: sonuclar.map((koltuknesnesi) {
                    // Grouping by vagonSiraNo
                    Map<int, List<KoltukDurum>> groupedByVagon = {};
                    for (var koltuk in koltuknesnesi.koltuklistesi) {
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
                        print(vagonSiraNo);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Vagon No: $vagonSiraNo',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.blueGrey)),
                            Text('Seçilen Saat: ${koltuknesnesi.saat}',
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
                  }).toList(),
                )*/

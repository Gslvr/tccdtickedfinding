/*
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
}*/

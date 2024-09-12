import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcddbiletfinding/core/constrant/degerler.dart';
import 'package:tcddbiletfinding/core/errors/errors.dart';
import 'package:injectable/injectable.dart';

import '../../../core/enums/post_status_enum.dart';
import '../../../data/model/vagon_koltuk.dart';
import '../../../domain/repository/tcdd_repo.dart';

part 'post_event.dart';

part 'post_state.dart';

@Injectable()
class SeatsBloc extends Bloc<SeatsEvent, SeatsState> {
  SeatsBloc({required this.postRepository}) : super(const SeatsState()) {
    ///
    on<SeatsListing>(_onFetchData);
  }

  IPostRepository postRepository;

  void groupAndSortKoltukListesi(List<KoltukDurum> koltukListesi) {
    // Group by vagonSiraNo
    Map<int, List<KoltukDurum>> groupedByVagon = {};
    for (var koltuk in koltukListesi) {
      if (!groupedByVagon.containsKey(koltuk.vagonSiraNo)) {
        groupedByVagon[koltuk.vagonSiraNo] = [];
      }
      groupedByVagon[koltuk.vagonSiraNo]!.add(koltuk);
    }

    // Sort each group
    for (var vagon in groupedByVagon.values) {
      vagon.sort((a, b) {
        if (a.koltukNo.toString().contains('h') && !b.koltukNo.toString().contains('h')) {
          return -1;
        } else if (!a.koltukNo.toString().contains('h') && b.koltukNo.toString().contains('h')) {
          return 1;
        } else {
          int aNum = int.tryParse(a.koltukNo.toString()) ?? 0;
          int bNum = int.tryParse(b.koltukNo.toString()) ?? 0;
          return aNum.compareTo(bNum);
        }
      });
    }

    // Display the grouped and sorted list
    groupedByVagon.forEach((vagonSiraNo, koltuklar) {
      for (var koltuk in koltuklar) {

      }
    });
  }
  FutureOr<void> _onFetchData(
    SeatsListing event,
    Emitter<SeatsState> emit,
  ) async
  {
    List<Map<String, dynamic>> saatler = event.saatler;
    List<KoltukDurum> koltukListesi = [];


    for (var saat in saatler) {
     for (var j = 1; j< saat['vagonlar'].length; j++){

      var body = {
        "kanalKodu": 3,
        "dil": 0,
        "seferBaslikId": saat['seferId'],
        "vagonSiraNo": j,
        "binisIst": event.binissehir,
        "InisIst": event.inisSehir
      };
      final result =
          await postRepository.getSeats(url: AppUrl().vagonApi, body: body);


      result.fold(
          (Failure failure) => emit(state.copyWith(status: PageStatus
              .failure,errorMessages: [failure.message]),),
          (List<KoltukDurum> list) {
            // Add the 'saat' to each KoltukDurum object
            for (var i = 0; i < list.length; i++) {
              list[i] = list[i].copyWith(saat: saat['saat']);
            }

        koltukListesi.addAll(list);
      });
    }
    }



    // Group by vagonSiraNo and saat
    Map<String, List<KoltukDurum>> groupedKoltukListesi = {};
    for (var koltuk in koltukListesi) {
      String key = '${koltuk.vagonSiraNo}-${koltuk.saat}';
      if (!groupedKoltukListesi.containsKey(key)) {
        groupedKoltukListesi[key] = [];
      }
      groupedKoltukListesi[key]!.add(koltuk);

    }
    groupAndSortKoltukListesi(koltukListesi);

    emit(state.copyWith(status: PageStatus.success, list: koltukListesi));
  }
}

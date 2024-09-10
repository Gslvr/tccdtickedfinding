import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcddbiletfinding/core/constrant/degerler.dart';
import 'package:tcddbiletfinding/core/errors/errors.dart';
import 'package:injectable/injectable.dart';

import '../../../core/enums/post_status_enum.dart';
import '../../../domain/repository/tcdd_repo.dart';

part 'post_event.dart';

part 'post_state.dart';

@Injectable()
class StationBloc extends Bloc<StationEvent, StationState> {
  StationBloc({required this.postRepository}) : super(const StationState()) {
    ///
    on<StationListing>(_onFetchData);
  }

  IPostRepository postRepository;

  FutureOr<void> _onFetchData(
    StationListing event,
    Emitter<StationState> emit,
  ) async {
    Map<String, dynamic> body = event.body;
    final result = await postRepository.getStationList(
        url: AppUrl().stationApi, body: body);
    result.fold(
        (Failure failure) => emit(state.copyWith(status: PageStatus.failure)),
        (List<Map<String, dynamic>> list) =>
            emit(state.copyWith(status: PageStatus.success, list: list)));
  }
}

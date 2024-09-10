part of 'post_bloc.dart';


class StationState extends Equatable {
  ///
  const StationState({
    this.status = PageStatus.initial,
    this.list
  });


  final PageStatus status;
  final List<Map<String,dynamic>>? list;

  ///
  StationState copyWith({
    PageStatus? status,
    List<Map<String,dynamic>>? list
  }) {
    return StationState(
      status: status ?? this.status,
      list: list ?? this.list
    );
  }

  @override
  List<Object> get props => [status,list??[]];
}

part of 'post_bloc.dart';



class SeatsState extends Equatable {
  const SeatsState({
    this.status = PageStatus.initial,
    this.list,
    this.errorMessages = const [],
  });

  final PageStatus status;
  final List<KoltukDurum>? list;
  final List<String> errorMessages;

  SeatsState copyWith({
    PageStatus? status,
    List<KoltukDurum>? list,
    List<String>? errorMessages,
  }) {
    return SeatsState(
      status: status ?? this.status,
      list: list ?? this.list,
      errorMessages: errorMessages ?? this.errorMessages,
    );
  }

  @override
  List<Object> get props => [status, list ?? [], errorMessages];
}
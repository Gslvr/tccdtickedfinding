part of 'post_bloc.dart';

sealed class StationEvent extends Equatable {
  const StationEvent();

  @override
  List<Object> get props => [];
}



final class StationListing extends StationEvent {
  final Map<String,dynamic> body;
  const StationListing(this.body);
  @override
  List<Object> get props => [body];
}





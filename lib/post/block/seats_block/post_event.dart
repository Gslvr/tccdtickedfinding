part of 'post_bloc.dart';

sealed class SeatsEvent extends Equatable {
  const SeatsEvent();

  @override
  List<Object> get props => [];
}



final class SeatsListing extends SeatsEvent {
  List<Map<String, dynamic>> saatler;
  String binissehir;
  String inisSehir;

   SeatsListing(this.saatler,this.binissehir,this.inisSehir);
  @override
  List<Object> get props => [saatler,binissehir,inisSehir];
}





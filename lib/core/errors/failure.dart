import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  ///
  const Failure({
    required this.message,
    this.statusCode,
  });

  ///
  final String message;
  final String? statusCode;

  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class ListFailure extends Failure {
  const ListFailure({required super.message, super.statusCode});
}
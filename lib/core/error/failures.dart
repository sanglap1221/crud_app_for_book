import 'package:equatable/equatable.dart';

// Base class for all failures in the app

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Failure related to server errors

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server Failure']);
}

// Failure related to cache errors

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache Failure']);
}

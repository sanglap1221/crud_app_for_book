// Custom exceptions for the app

class ServerException implements Exception {
  final String message;

  ServerException([this.message = 'Server Exception occurred']);

  @override
  String toString() => 'ServerException: $message';
}

class CacheException implements Exception {
  final String message;

  CacheException([this.message = 'Cache Exception occurred']);

  @override
  String toString() => 'CacheException: $message';
}

abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => 'AppException: $message';
}

class ServerException extends AppException {
  ServerException({String message = 'Server error occurred.'}) : super(message);
}

class NetworkException extends AppException {
  NetworkException({String message = 'Network error occurred.'}) : super(message);
}

class CacheException extends AppException {
  CacheException({String message = 'Cache error occurred.'}) : super(message);
}

class LocalStorageException extends AppException {
  LocalStorageException({String message = 'Local storage error occurred.'}) : super(message);
}

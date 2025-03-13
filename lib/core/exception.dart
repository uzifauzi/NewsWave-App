class ServiceException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

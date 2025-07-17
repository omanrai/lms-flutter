abstract class AppExceptions implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppExceptions(this.message, [this.stackTrace]); // This is correct

  @override
  String toString() => '$runtimeType: $message';
}

class CacheException extends AppExceptions {
  const CacheException(super.message,[super.stackTrace]);
}

// Somewhere else you likely have:
class NetworkException extends AppExceptions {
  const NetworkException(super.message, [super.stackTrace]); // Error occurs here
}

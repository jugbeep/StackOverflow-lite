abstract class Failure implements Exception {
  String get message;
}

class LoginError extends Failure {
  @override
  final String message;
  LoginError({required this.message});
}

class ErrorLoginEmail extends Failure {
  @override
  final String message;
  ErrorLoginEmail({required this.message});
}

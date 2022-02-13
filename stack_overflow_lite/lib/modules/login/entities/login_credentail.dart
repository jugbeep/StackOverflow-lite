import 'package:string_validator/string_validator.dart' as validator;

class LoginCredential {
  final String? email;
  final String? password;
  final String? phone;
  final String? code;
  final String? verificationId;

  LoginCredential._(
      {this.phone, this.verificationId, this.email, this.password, this.code});

  bool get isValidEmail => validator.isEmail(email ?? "");
  bool get isValidPassword =>
      password != null && password!.isNotEmpty && password!.length > 3;

  factory LoginCredential.withEmailAndPassword(
      {required String email, required String password}) {
    return LoginCredential._(
      email: email,
      password: password,
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:stack_overflow_lite/modules/login/entities/login_credentail.dart';

void main() {
  group("should check if field is valid or not", () {
    test('email and password', () {
      expect(
        LoginCredential.withEmailAndPassword(email: "", password: "")
            .isValidEmail,
        false,
      );
      expect(
        LoginCredential.withEmailAndPassword(email: "will", password: "")
            .isValidEmail,
        false,
      );
      expect(
        LoginCredential.withEmailAndPassword(
                email: "will@teste.com", password: "")
            .isValidEmail,
        true,
      );
      expect(
        LoginCredential.withEmailAndPassword(email: "", password: "123456")
            .isValidPassword,
        true,
      );
      expect(
        LoginCredential.withEmailAndPassword(email: "", password: "12")
            .isValidPassword,
        false,
      );
    });
  });
}

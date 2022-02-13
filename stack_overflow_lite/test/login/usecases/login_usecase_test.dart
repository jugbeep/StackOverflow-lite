import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:stack_overflow_lite/modules/login/entities/login_credentail.dart';
import 'package:stack_overflow_lite/modules/login/errors/errors.dart';
import 'package:stack_overflow_lite/modules/login/models/user.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';
import 'package:stack_overflow_lite/modules/login/usecases/login_usecase.dart';
import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
main() {
  final repository = MockLoginRepository();

  final usecase = LoginImpl(repository);

  test('should verify if email is not valid', () async {
    final result = await usecase(
        LoginCredential.withEmailAndPassword(email: "", password: ""));

    expect(result.leftMap((l) => l is ErrorLoginEmail), const Left(false));
  });

  test('should verify if password is not valid', () async {
    final result = await usecase(LoginCredential.withEmailAndPassword(
        email: "name@fake.com", password: ""));

    expect(result.leftMap((l) => l is ErrorLoginEmail), const Left(true));
  });

  test('should consume repository loginEmail', () async {
    var user = UserModel(email: "name@fake.com", uid: '123123');
    when(repository.loginEmail(email: 'name@fake.com', password: '123123'))
        .thenAnswer(
      (_) async {
        debugPrint('here');
        return Right(user);
      },
    );

    final result = await usecase(LoginCredential.withEmailAndPassword(
        email: "name@fake.com", password: "123123"));

    expect(result, Right(user));
  });
}

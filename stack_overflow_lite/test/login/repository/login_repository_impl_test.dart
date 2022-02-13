import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stack_overflow_lite/modules/login/entities/auth_user.dart';
import 'package:stack_overflow_lite/modules/login/errors/errors.dart';
import 'package:stack_overflow_lite/modules/login/models/user.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_datasource.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';
import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginDatasource])
main() {
  final datasource = MockLoginDatasource();
  final repository = LoginRepositoryImpl(datasource);
  final userReturn = UserModel(email: "fake@test.com", uid: '123456');

  group("loginEmail", () {
    test('should get UserModel', () async {
      when(datasource.loginEmail(email: "fake@test.com", password: '123456'))
          .thenAnswer((_) async => userReturn);

      final result = await repository.loginEmail(
          email: 'fake@test.com', password: '123456');

      expect(result, isA<Right<dynamic, LoggedUserInfo>>());
    });

    test('should call ErrorLoginEmail', () async {
      when(datasource.loginEmail(email: "fake@test.com", password: '123456'))
          .thenThrow(ErrorLoginEmail(message: 'There was an error'));

      final result = await repository.loginEmail(
          email: 'fake@test.com', password: '123456');

      expect(result.leftMap((l) => l is ErrorLoginEmail), const Left(true));
    });
  });

  group("loggedUser", () {
    test('should get Current User Logged', () async {
      when(datasource.currentUser()).thenAnswer((_) async => userReturn);

      var result = await repository.loggedUser();

      expect(result, isA<Right<dynamic, LoggedUserInfo>>());
    });

    test('should Throw when user not logged in', () async {
      when(datasource.currentUser())
          .thenThrow(ErrorGetLoggedUser(message: 'Logged in user error'));

      var result = await repository.loggedUser();

      expect(result.leftMap((l) => l is ErrorGetLoggedUser), const Left(true));
    });
  });

  group("logout", () {
    test('should get logout', () async {
      when(datasource.logout()).thenAnswer((_) async {});

      var result = await repository.logout();

      expect(result, isA<Right<dynamic, Unit>>());
    });

    test('should Throw when user try logout', () async {
      when(datasource.logout())
          .thenThrow(ErrorLogout(message: 'There was a problem loggin out'));

      var result = await repository.logout();

      expect(result.leftMap((l) => l is ErrorLogout), const Left(true));
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stack_overflow_lite/modules/login/errors/errors.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';
import 'package:stack_overflow_lite/modules/login/usecases/logout.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
main() {
  final repository = MockLoginRepository();
  final usecase = LogoutImpl(repository);
  test("should verify if exist user is logged in", () async {
    when(repository.logout()).thenAnswer((_) async => const Right(unit));

    var result = (await usecase()).fold((l) => null, (r) => r);

    expect(result, unit);
  });
  test("should return null if user not logged in", () async {
    when(repository.logout())
        .thenAnswer((_) async => Left(ErrorLogout(message: "Error in logout")));

    var result = (await usecase()).fold(id, id);

    expect(result, isA<ErrorLogout>());
  });
}

import 'package:dartz/dartz.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_datasource.dart';

import '../entities/auth_user.dart';
import '../errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      final user =
          await datasource.loginEmail(email: email, password: password);

      return Right(user);
    } catch (e) {
      return Left(ErrorLoginEmail(message: "Error login with Email"));
    }
  }
}

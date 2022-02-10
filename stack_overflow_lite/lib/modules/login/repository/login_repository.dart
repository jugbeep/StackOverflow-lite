import 'package:dartz/dartz.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_datasource.dart';

import '../entities/auth_user.dart';
import '../errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
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

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await datasource.currentUser();

      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: "Error trying to retrieve current logged user"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();

      return Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: "Error in logout"));
    }
  }
}

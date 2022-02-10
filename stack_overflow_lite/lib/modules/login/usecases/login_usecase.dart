import 'package:dartz/dartz.dart';
import 'package:stack_overflow_lite/modules/login/entities/auth_user.dart';

import '../errors/errors.dart';
import '../entities/login_credentail.dart';
import '../repository/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

class LoginImpl implements LoginUsecase {
  final LoginRepository repository;

  LoginImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    print(credential);
    if (!credential.isValidEmail) {
      return Left(LoginError(message: "Invalid email "));
    }

    return await repository.loginEmail(
        email: credential.email!, password: credential.password!);
  }
}

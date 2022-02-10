import 'package:dartz/dartz.dart';
import 'package:stack_overflow_lite/modules/login/entities/auth_user.dart';
import 'package:stack_overflow_lite/modules/login/errors/errors.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}

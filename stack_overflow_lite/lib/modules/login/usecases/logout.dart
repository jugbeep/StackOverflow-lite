import 'package:dartz/dartz.dart';
import 'package:stack_overflow_lite/modules/login/errors/errors.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl implements Logout {
  final LoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}

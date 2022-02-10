import 'package:stack_overflow_lite/modules/login/entities/auth_user.dart';
import 'package:stack_overflow_lite/modules/login/entities/logged_user.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({required String name, required String email})
      : super(name: name, email: email);

  LoggedUser toLoggedUser() => this;
}

import 'package:stack_overflow_lite/modules/login/entities/auth_user.dart';
import 'package:stack_overflow_lite/modules/login/entities/logged_user.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({required String email, required String uid})
      : super(email: email, uid: uid);

  LoggedUser toLoggedUser() => this;
}

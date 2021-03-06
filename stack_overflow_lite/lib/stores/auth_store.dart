import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:stack_overflow_lite/modules/login/entities/logged_user.dart';
import 'package:stack_overflow_lite/modules/login/models/user.dart';

import '../modules/login/entities/auth_user.dart';
import '../modules/login/usecases/get_logged_user.dart';
import '../modules/login/usecases/logout.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetLoggedUser getLoggedUser;
  final Logout logout;

  _AuthStoreBase(this.getLoggedUser, this.logout) {
    checkLogin();
  }

  @observable
  LoggedUserInfo user = UserModel(email: '', uid: '');

  @computed
  bool get isLogged => user.email != '';

  @action
  void setUser(LoggedUserInfo value) => user = value;

  Future<bool> checkLogin() async {
    var result = await getLoggedUser();
    return result.fold((l) => false, (newUser) {
      setUser(newUser);
      return true;
    });
  }

  Future signOut() async {
    var result = await logout();
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) {
      setUser(UserModel(email: '', uid: ''));
    });
  }
}

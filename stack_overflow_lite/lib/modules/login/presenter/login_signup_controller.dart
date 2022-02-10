import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:stack_overflow_lite/modules/login/entities/login_credentail.dart';
import 'package:stack_overflow_lite/modules/login/usecases/login_usecase.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'login_signup_controller.g.dart';

class LoginSignupController = _LoginSignupControllerBase
    with _$LoginSignupController;

abstract class _LoginSignupControllerBase with Store {
  final LoginUsecase loginWithEmail;
  final AuthStore authStore;

  _LoginSignupControllerBase(this.loginWithEmail, this.authStore);

  @observable
  bool loading = false;

  @observable
  String email = "";

  @action
  setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  @computed
  LoginCredential get credential =>
      LoginCredential.withEmailAndPassword(email: email, password: password);

  void login() async {
    loading = true;
    var result = await loginWithEmail(credential);
    loading = false;
    result.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message)));
    }, (user) {
      authStore.setUser(user);
      // Modular.to
      //     .popUntil(ModalRoute.withName(Modular.navigatorDelegate.modulePath));
      Modular.to.pushNamed('/home');
    });
  }
}

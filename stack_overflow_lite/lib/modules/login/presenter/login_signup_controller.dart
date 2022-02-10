import 'package:mobx/mobx.dart';
import 'package:stack_overflow_lite/modules/login/entities/login_credentail.dart';
import 'package:stack_overflow_lite/modules/login/usecases/login_usecase.dart';
part 'login_signup_controller.g.dart';

class LoginSignupController = _LoginSignupControllerBase
    with _$LoginSignupController;

abstract class _LoginSignupControllerBase with Store {
  final LoginUsecase loginWithEmail;

  _LoginSignupControllerBase(this.loginWithEmail);

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
  }
}

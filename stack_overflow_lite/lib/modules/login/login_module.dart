import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_page.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_signup_controller.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_datasource.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';
import 'package:stack_overflow_lite/modules/login/usecases/get_logged_user.dart';
import 'package:stack_overflow_lite/modules/login/usecases/login_usecase.dart';
import 'package:stack_overflow_lite/modules/login/usecases/logout.dart';
import 'package:stack_overflow_lite/stores/auth_store.dart';

class LoginModule extends Module {
  static List<Bind> export = [
    Bind.singleton((i) => LogoutImpl(i())),
    Bind.singleton((i) => LoginRepositoryImpl(i())),
    Bind.singleton((i) => GetLoggedUserImpl(i())),
    Bind.singleton((i) => FirebaseDatasourceImpl(i())),
  ];

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => LoginSignupController(i<LoginUsecase>(), i<AuthStore>())),
        Bind((i) => LoginImpl(i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginSignup()),
  ];
}

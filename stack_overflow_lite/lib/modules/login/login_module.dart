import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_page.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_signup_controller.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_datasource.dart';
import 'package:stack_overflow_lite/modules/login/repository/login_repository.dart';
import 'package:stack_overflow_lite/modules/login/usecases/login_usecase.dart';

class LoginModule extends Module {
  static List<Bind> export = [
    Bind.singleton((i) => LoginRepositoryImpl(i())),
    Bind.singleton((i) => FirebaseDatasourceImpl()),
  ];

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => LoginSignupController(i<LoginUsecase>())),
        Bind((i) => LoginImpl(i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginSignup()),
  ];
}

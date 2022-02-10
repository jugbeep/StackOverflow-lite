import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_page.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_signup_controller.dart';

class LoginModule extends Module {
  static List<Bind> export = [];

  @override
  List<Bind<Object>> get binds => [Bind((i) => LoginSignupController())];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginSignup()),
  ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_page.dart';

class LoginModule extends Module {
  static List<Bind> export = [];

  @override
  List<Bind<Object>> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginSignup()),
  ];
}

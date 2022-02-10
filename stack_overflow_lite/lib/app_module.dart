import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // ...LoginSignupModule.export,
    // Bind((i) => FirebaseAuth.instance),
    // Bind((i) => AuthStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];
}

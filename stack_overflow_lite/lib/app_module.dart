import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/home/home_module.dart';
import 'package:stack_overflow_lite/modules/login/login_module.dart';

import 'modules/splash_screen/splash_screen_module.dart';
import 'stores/auth_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...LoginModule.export,
    Bind((i) => FirebaseAuth.instance),
    Bind((i) => AuthStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashScreenModule()),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/home", module: HomeModule()),
  ];
}

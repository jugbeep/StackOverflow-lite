import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/splash_screen/splash_page.dart';

class SplashScreenModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashScreenPage()),
  ];
}

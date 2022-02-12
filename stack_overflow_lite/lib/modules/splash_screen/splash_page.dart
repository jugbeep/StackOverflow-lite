import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/stores/auth_store.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key) {
    Modular.get<AuthStore>().checkLogin().then((v) {
      Future.delayed(const Duration(seconds: 1), () {
        if (v == true) {
          Modular.to.pushNamed('/home/');
        } else {
          Modular.to.pushNamed('/login/');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

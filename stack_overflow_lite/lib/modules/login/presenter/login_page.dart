import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stack_overflow_lite/modules/login/presenter/login_signup_controller.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState
    extends ModularState<LoginSignup, LoginSignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Stack Overflow Lite'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: GlobalKey(),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Username'),
                  ),
                  onChanged: controller.setEmail,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  onChanged: controller.setPassword,
                ),
              ],
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            onPressed: controller.login,
            child: controller.loading
                ? const Center(child: CircularProgressIndicator())
                : const Text('Login'),
            color: Theme.of(context).primaryColor,
          ),
        ]),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key? key}) : super(key: key);

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
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            onPressed: () {},
            child: const Text('LOGIN'),
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 10),
          MaterialButton(
            onPressed: () {},
            child: const Text('SIGNUP'),
          ),
        ]),
      ],
    ));
  }
}

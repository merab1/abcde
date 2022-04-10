import 'package:flutter/material.dart';

class LoginRegistration extends StatelessWidget {
  const LoginRegistration({Key? key}) : super(key: key);
  static const String pathId = 'login or registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Auth'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: const Text('Registration'),
            ),
          ],
        ),
      ),
    );
  }
}

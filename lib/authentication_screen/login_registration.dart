import 'package:abcde/authentication_screen/registration.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class LoginRegistration extends StatelessWidget {
  const LoginRegistration({Key? key}) : super(key: key);
  static const String pathId = 'login or registration';
///ვიჯეტები,ღილაკები რეგისტრაციისა და შესვლისთვის
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
              onPressed: () {
                Navigator.pushNamed(context, Login.pathId);
              },
              color: Colors.blue,
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, Registration.pathId);
              },
              color: Colors.blue,
              child: const Text('Registration'),
            ),
          ],
        ),
      ),
    );
  }
}

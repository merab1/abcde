import 'package:abcde/authentication_screen/login_registration.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  static const String pathId = 'auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginRegistration.pathId);
                },
                child: const Text('Sign in with email'),
                minWidth: 210,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('Sign in with Google'),
                minWidth: 210,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('Sign in with phone number'),
                minWidth: 210,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

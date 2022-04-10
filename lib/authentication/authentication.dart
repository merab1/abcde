import 'package:flutter/cupertino.dart';
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
                onPressed: () {},
                child: const Text('Sign in with email'),
                minWidth: 160,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('Sign in Google'),
                minWidth: 160,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text('Sign phone number'),
                minWidth: 160,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

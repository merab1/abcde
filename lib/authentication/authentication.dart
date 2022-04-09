import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  static const String pathId = 'auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: const SafeArea(
        child: Center(
          child: Text('Auth Screen'),
        ),
      ),
    );
  }
}

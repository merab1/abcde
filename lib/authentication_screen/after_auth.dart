import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AfterAuth extends StatelessWidget {
  const AfterAuth({Key? key}) : super(key: key);
  static const String pathId = 'Welcome Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome'),),
      body: const Center(
        child: Text('Welcome to the club'),
      ),
    );
  }
}

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('xdsds'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: const Text('sdsds'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              child: const Text('dfdfd'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              child: const Text('dsds'),
              onPressed: () {},
              color: Colors.green,
            ),
            const SizedBox(
              height: 10,
            ),
            RawMaterialButton(
              fillColor: Colors.green,
              child: const Text('dsdsds'),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton(
              color: Colors.green,
              child: const Text('dsdsd'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

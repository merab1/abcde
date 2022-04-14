import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  static const String pathId = 'Registration';

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email = '';
  String _password = '';

  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: _isLoading == true
          ? const Center(child: LinearProgressIndicator())
          : SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration:
                const InputDecoration(hintText: 'Enter your email'),
                onChanged: ((text) {
                  _email = text;
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration:
                const InputDecoration(hintText: 'Enter your password'),
                onChanged: ((text) {
                  _password = text;
                }),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                if (_email == '' && _password != '') {
                  const snackBar =
                  SnackBar(content: Text('Please, enter email'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (_email != '' && _password == '') {
                  const snackBar =
                  SnackBar(content: Text('Please, enter password'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (_email == '' && _password == '') {
                  const snackBar = SnackBar(
                      content: Text('Please, enter email & password'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    _isLoading = true;
                    print(_email);
                    print(_password);
                  });
                }
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  if(newUser != null) {
                    Navigator.pushNamed(context, AfterAuth.pathId);
                  }
                } catch(e) {
                  print(e);
                }
              },
              child: const Text('Registration'),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

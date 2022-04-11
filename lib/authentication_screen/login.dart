import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  static const String pathId = 'Login';
  String _email = '';
  String _password = '';

  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _isLoading == true
          ? const Center(
              child: LinearProgressIndicator(),
            )
          : SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextField(
                    decoration: const InputDecoration(hintText: 'Enter your email'),
                    onChanged: ((text) {
                      _email = text;
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   TextField(
                    decoration:
                        const InputDecoration(hintText: 'Enter your password'),
                    onChanged: ((text) {
                      _password = text;
                    }),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
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
                     //   setState(() {
                          _isLoading = true;
                     //   });
                      }
                    },
                    child: const Text('Login'),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
    );
  }
}

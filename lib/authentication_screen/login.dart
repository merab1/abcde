import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:abcde/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String pathId = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  CustomTextField(
                    onChanged: (value) {
                      _email = value;
                    },
                    isEmailTextField: true,
                    isPassword: false,
                    isPhoneNumber: false,
                    isSmsCode: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    isSmsCode: false,
                    isPhoneNumber: false,
                    isPassword: true,
                    isEmailTextField: false,
                    onChanged: (value) {
                      _password = value;
                    },
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
                        final user = await _auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        if (user != null) {
                          Navigator.pushNamed(context, AfterAuth.pathId);
                        }
                      } catch (e) {
                        print(e);
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

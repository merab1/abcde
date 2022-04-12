import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);
  static const String pathId = 'PhoneLogin';

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  String _phoneNumber = '';

  String _smsCode = '';

  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Registration'),
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
              keyboardType: TextInputType.phone,
              decoration:
              const InputDecoration(hintText: 'Enter your phone'),
              onChanged: ((text) {
                _phoneNumber = text;
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
              const InputDecoration(hintText: 'Enter your  sms code'),
              onChanged: ((text) {
                _smsCode = text;
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                if (_phoneNumber == '' && _smsCode != '') {
                  const snackBar =
                  SnackBar(content: Text('Please, enter phone'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (_phoneNumber != '' && _smsCode == '') {
                  const snackBar =
                  SnackBar(content: Text('Please, enter sms code'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else if (_phoneNumber == '' && _smsCode == '') {
                  const snackBar = SnackBar(
                      content: Text('Please, enter phone & sms code'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  setState(() {
                    _isLoading = true;
                    print(_phoneNumber);
                    print(_smsCode);
                  });
                }
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: _phoneNumber, password: _smsCode);
                  if(user != null) {
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

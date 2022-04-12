import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SmsCode extends StatefulWidget {
  const SmsCode({Key? key}) : super(key: key);
  static const String pathId = 'Sms Code';

  @override
  State<SmsCode> createState() => _SmsCodeState();
}

class _SmsCodeState extends State<SmsCode> {

  String _smsCode = '';

  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Code'),
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
                if (_smsCode == '') {
                  const snackBar =
                  SnackBar(content: Text('Please, enter SMS Code'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }  else {
                  setState(() {
                    _isLoading = true;
                    print(_smsCode);
                  });
                }
                try {
                  final user = await _auth.signInWithPhoneNumber(
                       _smsCode);
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

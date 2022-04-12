import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:abcde/authentication_screen/sms_code.dart';
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

  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
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
                        const InputDecoration(hintText: 'Verify your phone'),
                    onChanged: ((text) {
                      _phoneNumber = text;
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (_phoneNumber == '') {
                        const snackBar = SnackBar(
                            content: Text('Please, enter your phone number'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        setState(() {
                          _isLoading = true;
                          print(_phoneNumber);
                        });
                      }
                      try {
                        final user = await _auth.verifyPhoneNumber(
                          phoneNumber: _phoneNumber,
                          codeAutoRetrievalTimeout: (String verificationId) {},
                          verificationCompleted:
                              (PhoneAuthCredential phoneAuthCredential) {},
                          codeSent: (String verificationId,
                              int? forceResendingToken) {},
                          verificationFailed: (FirebaseAuthException error) {},
                        );

                          Navigator.pushNamed(context, SmsCode.pathId);

                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text('Submit'),
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
    );
  }
}

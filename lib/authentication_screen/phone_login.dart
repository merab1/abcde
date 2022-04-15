import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:abcde/authentication_screen/sms_code.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/custom_textfield.dart';

/*enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}*/

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);
  static const String pathId = 'PhoneLogin';

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
/*  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;*/
  String _phoneNumber = '';
  String _smsCode = '';

  final _auth = FirebaseAuth.instance;

 // bool _isLoading = false;
  String verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Phone Number'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              onChanged: (value) {
                _phoneNumber = value;
              },
              isEmailTextField: false,
              isPassword: false,
              isPhoneNumber: true,
              isSmsCode: false,
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
                  print(_phoneNumber);
                  const snackBar = SnackBar(content: Text('Wait for the SMS'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
/*                  setState(() {
                    _isLoading = true;
                    print(_phoneNumber);
                  });*/
                }
                try {
                  await _auth.verifyPhoneNumber(
                    timeout: const Duration(seconds: 60),

                    phoneNumber: _phoneNumber,

                    codeAutoRetrievalTimeout: (String verificationId) {},

                    verificationCompleted:
                        (PhoneAuthCredential phoneAuthCredential) async {
                      await _auth.signInWithCredential(phoneAuthCredential);
                    },
                      codeSent: (String verificationIdFromFirebase,
                          int? forceResendingToken) async {
                        verificationId = verificationIdFromFirebase;
                        String smsCode = _smsCode;
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: smsCode);
                        await _auth.signInWithCredential(credential);
                      },

                    verificationFailed: (FirebaseAuthException error) {
                      if (error.code == 'invalid-phone-number') {
                        print('The provided phone number is not valid.');
                      }
                    },
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Verify'),
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (value) {
                _smsCode = value;
              },
              isEmailTextField: false,
              isPassword: false,
              isPhoneNumber: false,
              isSmsCode: true,
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
                } else {
                  print(_smsCode);
/*                  setState(() {
                    _isLoading = true;
                    print(_smsCode);
                  });*/
                }
                try {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId, smsCode: _smsCode);
                  await _auth.signInWithCredential(phoneAuthCredential);
                  // signInWithPhoneAuthCredential(phoneAuthCredential);
                  Navigator.pushNamed(context, AfterAuth.pathId);
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

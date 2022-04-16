import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:abcde/authentication_screen/login_registration.dart';
import 'package:abcde/authentication_screen/phone_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);
  ///ეს გამოიყენება ნავიგატორისთვის
  static const String pathId = 'auth';
///ვიჯეტები, სათიათაოდ მგონი არ ღირს დაწერა
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginRegistration.pathId);
                },
                child: const Text('Sign in with email'),
                minWidth: 210,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  signInWithGoogle().then((value) {
                    print(value.user!.uid);
                    Navigator.pushNamed(context, AfterAuth.pathId);
                  });
                },
                child: const Text('Sign in with Google'),
                minWidth: 210,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, PhoneLogin.pathId);
                },
                child: const Text('Sign in with phone number'),
                minWidth: 210,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
///გუგლის კლასი, რომელიც უზრუველყოფს გუგლის ავტორიზაციით სისტემაში შესვლას.
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

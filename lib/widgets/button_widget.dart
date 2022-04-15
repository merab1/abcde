import 'package:flutter/material.dart';

Widget customButton({
  required Function onPressed,
  required bool isLogin,
  required bool isRegistration,
  required bool isVerify,
  required bool isSignInEmail,
  required bool isSignInGoogle,
  required bool isSignInPhone,
}) {
  String login = 'Login';
  String registration = 'Registration';
  String verify = 'Verify';
  String signInEmail = 'Sing in with email';
  String singInGoogle = 'Sign in with Google';
  String signInPhone = 'Sign in with phone number';
  double bigButtonWidth = 210;
  double smallButtonWidth = 30;

  return MaterialButton(
    minWidth: (isSignInEmail || isSignInGoogle || isSignInPhone)
        ? bigButtonWidth
        : smallButtonWidth,
    color: Colors.blue,
    child: Text(isLogin
        ? login
        : isRegistration
            ? registration
            : isVerify
                ? verify
                : isSignInEmail
                    ? signInEmail
                    : isSignInGoogle
                        ? singInGoogle
                        : isSignInPhone
                            ? signInPhone
                            : ''),
    onPressed: onPressed(),
  );
}

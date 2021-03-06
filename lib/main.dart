import 'package:abcde/authentication_screen/after_auth.dart';
import 'package:abcde/authentication_screen/login.dart';
import 'package:abcde/authentication_screen/login_registration.dart';
import 'package:abcde/authentication_screen/pages/photos_page.dart';
import 'package:abcde/authentication_screen/phone_login.dart';
import 'package:abcde/authentication_screen/registration.dart';
import 'package:abcde/authentication_screen/sms_code.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'authentication_screen/authentication_screeen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: Auth.pathId,
      routes: {
        Auth.pathId: (context) => const Auth(),
        LoginRegistration.pathId: (context) => const LoginRegistration(),
        Login.pathId: (context) => const Login(),
        Registration.pathId: (context) => const Registration(),
        AfterAuth.pathId: (context) => AfterAuth(),
        PhoneLogin.pathId: (context) => const PhoneLogin(),
        SmsCode.pathId: (context) => const SmsCode(),
        PhotosPage.pathId: (context) => PhotosPage(),
      },
    );
  }
}

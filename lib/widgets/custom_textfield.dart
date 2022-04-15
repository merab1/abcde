import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  // final String hintText;
  String inputText;
  final bool isEmailTextField;
  final bool isPhoneNumber;
  final bool isPassword;
  final bool isSmsCode;

  CustomTextField({
    //  required this.hintText,
    required this.inputText,
    required this.isEmailTextField,
    required this.isPassword,
    required this.isPhoneNumber,
    required this.isSmsCode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String mail = 'Enter your email';
  String pass = 'Enter your password';
  String phone = 'Verify your phone number';
  String sms = 'Enter your SMS code';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        keyboardType: widget.isEmailTextField
            ? TextInputType.emailAddress
            : widget.isPhoneNumber
                ? TextInputType.phone
                : widget.isSmsCode
                    ? TextInputType.number
                    : null,
        obscureText: widget.isPassword ? true : false,
        decoration: InputDecoration(
          hintText: widget.isEmailTextField
              ? mail
              : widget.isPassword
                  ? pass
                  : widget.isPhoneNumber
                      ? phone
                      : widget.isSmsCode
                          ? sms
                          : null,
        ),
        onChanged: ((text) {
          widget.inputText = text;
        }),
      ),
    );
  }
}

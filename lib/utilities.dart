import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

const OutlineInputBorder textFieldFoucedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 2,
  ),
);

const OutlineInputBorder textFieldunabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide(
    color: Colors.grey,
    width: 1,
  ),
);

String? Function(String?) emailValidator = (email) =>
    email != null && !EmailValidator.validate(email)
        ? "*Enter a valid email"
        : null;

String? Function(String?) passwordValidator = (password) =>
    password != null && password.length < 6 ? "Enter min. 6 charactor" : null;

showSnackBar(String? text) {
  if (text == null) return;

  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
  );

  messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class AppState with ChangeNotifier {
  AppState();

  String _home = "";
  String get home => _home;

  void changeHomeText(String text) {
    _home = text;
    notifyListeners();
  }

  void cycleHomeText(int i) {
    List text = ['home', 'profile', 'revolution'];

    _home = text[i];
    notifyListeners();
  }

  String _emailValid = 'none';
  String get emailValid => _emailValid;
  //inorder to show regular Textform field without error or input
  String _emailErrorMsg = null;
  String get emailErrorMsg => _emailErrorMsg;

  Future<String> verifyEmail(String email) async {
    if (email.isEmpty) {
      _emailValid = 'false';
      notifyListeners();
      return _emailErrorMsg = 'Email Field is empty';
    } else if (!email.contains('@')) {
      _emailValid = 'false';
      notifyListeners();
      return _emailErrorMsg = 'Email needs to have an @ symbol';
    } else if (email.contains(' ')) {
      _emailValid = 'false';
      notifyListeners();
      return _emailErrorMsg = 'Email has an extra space';
      // } else if (!email.contains(RegExp(
      //     r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"))) {
      //   _emailValid = 'false';
      //   notifyListeners();
      //   // return _emailErrorMsg = 'Trailing Missing Example *.com';
      //   return _emailErrorMsg = 'Email is Invalid';
      // }
    } else if (EmailValidator.validate(email)) {
      _emailValid = 'true';
      notifyListeners();
      print(_emailValid);
      return _emailErrorMsg = null;
    } else {
      _emailValid = 'false';
      notifyListeners();
      print(_emailValid);
      return _emailErrorMsg = 'Email is not Valid';
    }
  }

  String _passwordValid = 'none';
  String get passwordValid => _passwordValid;
  //inorder to show regular Textform field without error or input
  String _passwordErrorMsg = null;
  String get passwordErrorMsg => _passwordErrorMsg;

  Future<String> verifyPassword(String password) async {
    if (password.isEmpty) {
      _passwordValid = 'false';
      notifyListeners();
      return _passwordErrorMsg = 'Password is empty';
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      _passwordValid = 'false';
      notifyListeners();
      return _passwordErrorMsg = 'Needs to have upper case characters';
    } else if (!password.contains(RegExp(r'[a-z]'))) {
      _passwordValid = 'false';
      notifyListeners();
      return _passwordErrorMsg = 'Needs to have lower case characters';
    } else if (password.length < 8) {
      _passwordValid = 'false';
      notifyListeners();
      return _passwordErrorMsg = 'Needs to be 8+ Characters';
    } else if (password.contains(' ')) {
      _passwordValid = 'false';
      notifyListeners();
      return _passwordErrorMsg = 'Email has an extra space';
    }
    notifyListeners();
    _passwordValid = 'true';
    return _passwordErrorMsg = null;
  }
}

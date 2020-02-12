import 'package:flutter/material.dart';

class UserState with ChangeNotifier {
  UserState();

  String _displayText = "";

  void setDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;
}

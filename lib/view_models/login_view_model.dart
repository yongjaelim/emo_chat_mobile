import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  String _id = '';
  String _password = '';
  bool _buttonEnabled = false;

  String get getId => _id;
  String get getPassword => _password;
  bool get getButtonEnabled => _buttonEnabled;

  void setId(String value) {
    _id = value;
    _updateButtonEnabled();
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _updateButtonEnabled();
    notifyListeners();
  }

  void _updateButtonEnabled() {
    _buttonEnabled = _id.isNotEmpty && _password.isNotEmpty;
  }

  void makeFieldsEmpty() {
    setId('');
    setPassword('');
  }
}
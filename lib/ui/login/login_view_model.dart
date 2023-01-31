import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  String id = '';
  String password = '';
  bool _buttonEnabled = false;

  String get getId => id;
  String get getPassword => password;
  bool get getButtonEnabled => _buttonEnabled;

  void setId(String value) {
    id = value;
    _updateButtonEnabled();
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    _updateButtonEnabled();
    notifyListeners();
  }

  void _updateButtonEnabled() {
    _buttonEnabled = id.isNotEmpty && password.isNotEmpty;
  }

  void controlLoginButton() {
    setId('');
    print(id);
    setPassword('');
    print(password);
    _updateButtonEnabled();
  }
}
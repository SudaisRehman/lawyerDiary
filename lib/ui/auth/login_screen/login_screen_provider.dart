import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool rememberMe = false;
  bool isvisible = true;
  bool isPasword = true;
  bool isconfirmPassword = true;
  bool rememberMe2 = false;
  bool rememberMe3 = false;

  void toggleCheckbox() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void toggleCheckbox2() {
    rememberMe2 = !rememberMe2;
    notifyListeners();
  }

  void toggleCheckbox3() {
    rememberMe3 = !rememberMe3;
    notifyListeners();
  }

  void visiblePassword() {
    isvisible = !isvisible;
    notifyListeners();
  }

  void fornew() {
    isPasword = !isPasword;
    notifyListeners();
  }

  void confirm() {
    isconfirmPassword = !isconfirmPassword;
    notifyListeners();
  }
}

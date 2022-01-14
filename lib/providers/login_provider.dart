import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String name = '';
  TextEditingController userController = TextEditingController();
  //
  void validation(String value) {
    name = value;
    notifyListeners();
  }
}

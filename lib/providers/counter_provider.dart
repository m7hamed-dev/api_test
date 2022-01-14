import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  String value = '';

  TextEditingController textEditingController = TextEditingController();

  onChange(String valueFromUser) {
    value = valueFromUser;
    // notifyListeners();
  }

  void add() {
    counter++;
    notifyListeners();
  }
}

class ResCounterProvider extends ChangeNotifier {
  int counter = 0;
  void add() {
    counter++;
  }
}

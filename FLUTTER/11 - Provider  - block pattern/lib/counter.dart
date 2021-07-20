import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _sayac;

  int get sayac => _sayac;

  Counter(this._sayac);

  void arttir() {
    _sayac++;
    notifyListeners(); //değişiklikleri sağlamak için
  }

  void azalt() {
    _sayac--;
    notifyListeners();
  }
}

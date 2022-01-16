import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;


  add() {
    _count++;
    notifyListeners();  /// 상태 변화 알림
  }

  subtract() {
    _count--;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  Future<void> setCurrentIndex(int index) async {
    _currentIndex = index;
    notifyListeners();
  }
}

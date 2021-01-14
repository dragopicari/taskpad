import 'package:flutter/material.dart';

class BottomBarValueProvider with ChangeNotifier {
  int _selectedIndex = 2;

  int get selectedIndex => _selectedIndex;

  setIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }
}

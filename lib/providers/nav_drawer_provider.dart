import 'package:alexandria/data/navigation_drawer_items.dart';
import 'package:flutter/material.dart';

class NavDrawerProvider extends ChangeNotifier {
  int idx = 0;

  void setIdx(int newIdx) {
    int len = navigationDrawerItems.length;
    int minIdx = 0;
    int maxIdx = len - 1;
    if (newIdx > maxIdx || newIdx < minIdx) {
      throw IndexError.withLength(newIdx, len);
    }
    idx = newIdx;
    notifyListeners();
  }
}

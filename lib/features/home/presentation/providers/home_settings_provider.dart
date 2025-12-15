import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSettingsProvider extends ChangeNotifier {
  static const String _alignmentKey = 'home_alignment';
  
  CrossAxisAlignment _alignment = CrossAxisAlignment.center;

  CrossAxisAlignment get alignment => _alignment;

  HomeSettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_alignmentKey) ?? 1; // Default to Center (index 1)
    _alignment = _indexToAlignment(index);
    notifyListeners();
  }

  Future<void> setAlignment(CrossAxisAlignment alignment) async {
    _alignment = alignment;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_alignmentKey, _alignmentToIndex(alignment));
  }

  int _alignmentToIndex(CrossAxisAlignment alignment) {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return 0;
      case CrossAxisAlignment.center:
        return 1;
      case CrossAxisAlignment.end:
        return 2;
      default:
        return 1;
    }
  }

  CrossAxisAlignment _indexToAlignment(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.center;
      case 2:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.center;
    }
  }
}

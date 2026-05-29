import 'package:flutter/material.dart';

class OnboardingNotifier extends ChangeNotifier {

  // Private variable
  int _selectedPage = 0;

  // Getter
  int get selectedPage => _selectedPage;

  // Setter
  set setSelectedPage(int index) {
    _selectedPage = index;
    
    // Notify UI to rebuild
    notifyListeners();
  }
}
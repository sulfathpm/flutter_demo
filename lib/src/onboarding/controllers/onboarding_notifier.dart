import 'package:flutter/material.dart';

<<<<<<< HEAD
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
=======
class OnboardingNotifier with ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set setSelectedPage(int page) {
    _selectedPage = page;
    notifyListeners();
  }
}
>>>>>>> 4dd434b4efd5c81b5151152d3ad14a57285b5e97

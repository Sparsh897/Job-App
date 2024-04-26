import 'package:flutter/material.dart';

class OnBoardNotifier extends ChangeNotifier {
  
  bool _islastPage = false;

   bool get islastPage => _islastPage;
   set islastPage(bool value) {
     _islastPage = value;
     notifyListeners();
   }

}



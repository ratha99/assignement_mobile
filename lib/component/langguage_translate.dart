import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/material.dart';

class LanguageLogic extends ChangeNotifier{
  Language _lang = Khmer();
  Language get lang => _lang;
  int _langIndex = 0;
  int get langIndex => _langIndex;

  void changToKhmer(){
    _lang = Khmer();
    _langIndex = 0;
    notifyListeners();
  }

  void changeToEnglish(){
    _lang = Language();
    _langIndex = 1;
    notifyListeners();
  }

}
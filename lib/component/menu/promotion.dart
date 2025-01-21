import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Promotion extends StatefulWidget {
  const Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    return Scaffold(
      appBar: AppBar(
        title: Text(_lang.discount),
      ),
      body:Center(
        child: Text("No promotion to show"),
      )
    );
  }
}
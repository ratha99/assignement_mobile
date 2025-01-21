import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenedScreen extends StatefulWidget {
  @override
  State<ListenedScreen> createState() => _ListenedScreenState();
}

class _ListenedScreenState extends State<ListenedScreen> {
  // const SecondScreen({super.key});
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        _lang.listened,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        _buildListItem('Listened', '0 items', Icons.headset, ListenedScreen()),
      ],
    );
  }

  Widget _buildListItem(
      String title, String subtitle, IconData icon, Widget screen) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text("Put content here"),
    );
  }
}

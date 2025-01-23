import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:ebook_ui_assignment/theme/them_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Subscriber extends StatefulWidget {
  @override
  State<Subscriber> createState() => _SubscriberState();
}

class _SubscriberState extends State<Subscriber> {
  Language _lang = Khmer();
  
  int? selectedIndex; // Tracks the currently selected card index

  void _onCardTap(int index) {
    setState(() {
      selectedIndex = index; // Update the selected card index
    });
  }

  // const Subscriber({super.key});
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
  //  ThemeMode mode = context.watch<ThemeLogic>().mode;
    // bool _isHighlighted = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(_lang.plan),
      ),
      body: Column(
        children: [
          Expanded(
            // Constrain ListView to take up available space
            child: ListView(
              children: [
                _buildCard(
                    _lang.year1, _lang.unlimited, Icons.headphones, "USD 15/year", 0),
                _buildCard(_lang.months6, _lang.unlimited, Icons.headphones,
                    "USD 10/month", 1),
                _buildCard(_lang.months3, _lang.unlimited, Icons.headphones,
                    "USD 5/month", 2),
                _buildCard(_lang.monthly,_lang.unlimited, Icons.headphones,
                    "USD 2.3/month", 3),
              ],
            ),
          ),
          _buildContinueButton()
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
      child: Container(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {
            // Handle login logic here
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(100, 60),
            backgroundColor: const Color.fromARGB(255, 50, 139, 211),

            // Change this to your desired color
          ),
          child: Text('Continue', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, IconData icon,
      String trailing, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onCardTap(index),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Card(
          color: isSelected
              ? const Color.fromARGB(255, 87, 120, 146)
              : Theme.of(context).drawerTheme.backgroundColor, // Set background color dynamically
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // elevation: 5,
          child: ListTile(
            leading: Icon(icon, size: 30),
            title: Text(title, style: TextStyle(fontSize: 20)),
            subtitle: Text(subtitle),
            trailing: Text(trailing, style: TextStyle(fontSize: 20))),
          ),
        ),
      );
    
  }
}

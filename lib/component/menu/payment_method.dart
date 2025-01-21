import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    return Scaffold(
      appBar: AppBar(
        title: Text(_lang.payment),
      ),
      body:Center(
        child: Column(
          children: [
              Text("No payment method to show"),
              _buildContinueButton()
            
          ],
        ),
      )
    );
  }
    Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
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
}
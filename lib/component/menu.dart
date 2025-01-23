import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/component/menu/aboutus.dart';
import 'package:ebook_ui_assignment/component/menu/favorite.dart';
import 'package:ebook_ui_assignment/component/menu/notification.dart';
import 'package:ebook_ui_assignment/component/menu/payment_method.dart';
import 'package:ebook_ui_assignment/component/menu/policy.dart';
import 'package:ebook_ui_assignment/component/menu/promotion.dart';
import 'package:ebook_ui_assignment/component/menu/subscriber.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // const MenuScreen({super.key});
  Language _lang = Khmer();

  int _langIndex = 0;

  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    return Scaffold(
    
      body: _bulldMenu(),
      
    );
  }

  Widget _bulldMenu() {
    return ListView(
      children: [
          _buildCard(_lang.plan,Icons.subscriptions_outlined,Colors.amber.shade300,Subscriber()),
          _buildCard(_lang.favorite,Icons.favorite_outline,Colors.amber.shade300,Favorite()),
          _buildCard(_lang.discount,Icons.discount_outlined,Colors.amber.shade300,Promotion()),
          _buildCard(_lang.payment,Icons.payment_outlined,Colors.amber.shade300,PaymentMethod()),
          _buildCard(_lang.notification,Icons.notifications_none_outlined,Colors.amber.shade300,NotificationScreen()),
          _buildCard(_lang.aboutUs,Icons.info_outline,Colors.amber.shade300,Aboutus()),
          _buildCard(_lang.policy,Icons.policy,Colors.amber.shade300,PolicyScreen()),
          _buildCard(_lang.suppot,Icons.support,Colors.amber.shade300,Subscriber()),
      ],
    );
  }
   Widget _buildCard(String title, IconData icon, Color color, Widget page){
    return Card(
            child: ListTile(
              leading: Icon(icon, color: color,),
              title: Text(title),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => page),
                );
              },
            ),
        );
  }

}
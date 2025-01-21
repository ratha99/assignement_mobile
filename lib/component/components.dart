import 'package:flutter/material.dart';
class Components{
  Widget card(String title, String subtitle, String image){
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Image.asset(image),
      ),
    );
  }
}
// import 'package:app1/basic_module/food_data.dart';
import 'package:ebook_ui_assignment/component/home/book_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class Detail_Screen extends StatefulWidget {
  //const MyWidget({super.key});
  BookModel item;
  Detail_Screen(this.item);

  @override
  State<Detail_Screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Detail_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.network(this.widget.item.img),
          Text(
            this.widget.item.title,
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${this.widget.item.price}",
            style: TextStyle(fontSize: 30),
          ),
          
        RatingStars(
            value: this.widget.item.rate,
            starColor: Colors.orange,
            starOffColor: Colors.grey,
            valueLabelColor: Colors.orange,
            starSize: 30,
            valueLabelTextStyle: TextStyle(fontSize: 20, color: Colors.white),
          ),

          Text(
              "${this.widget.item.shop}",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

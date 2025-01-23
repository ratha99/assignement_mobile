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
        title: const Text(
          "Book Detail",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.item.img,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                widget.item.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              // Price
              Text(
                "USD ${widget.item.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingStars(
                    value: widget.item.rate,
                    starColor: Colors.orange,
                    starOffColor: Colors.grey,
                    starSize: 24,
                    valueLabelColor: Colors.orange,
                    valueLabelTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description (Optional)
              const Text(
                "Description:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "This book contains essays on friendship that explore themes of connection, understanding, and shared experiences. It's a perfect read for anyone looking to deepen their understanding of relationships.",
                style: TextStyle(fontSize: 16,  height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

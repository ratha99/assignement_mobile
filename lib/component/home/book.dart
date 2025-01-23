import 'package:ebook_ui_assignment/component/home/book_data.dart';
import 'package:ebook_ui_assignment/component/home/book_detail_screen.dart';
import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  Language _lang = Khmer();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          _lang.book,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildSearch(),
        _buildBook(bookModelList), // Second book list - Vertical
      ],
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: _lang.search,
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildNewBookItems(BookModel items) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => Detail_Screen(items)),
            );
          },
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items at the top
            children: [
              Container(
                height: 150, // Adjust height as needed
                width: 100, // Adjust width as needed
                margin: EdgeInsets.all(10), // Add some spacing
                child: Image.network(
                  items.img,
                  fit: BoxFit.cover, // Ensure the image fits properly
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align text to the left
                  children: [
                    Text(
                      items.title,
                      overflow: TextOverflow.ellipsis, // Handle long text
                      maxLines: 2, // Limit text to 2 lines
                      style: TextStyle(
                        fontSize: 14, // Adjust font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: 5), // Add some spacing between title and date
                    Text(
                      "Price: USD ${items.price}",
                      style: TextStyle(
                        fontSize: 14, // Adjust font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                        height: 5), // Add some spacing between title and date
                    Text(
                      "Date: ${items.date}",
                      style: TextStyle(
                        fontSize: 14, // Adjust font size
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    RatingStars(
                      value: items.rate.toDouble(),
                      starColor: Colors.orange,
                      starOffColor: Colors.grey,
                      valueLabelColor: Colors.orange,
                      starSize: 15,
                      valueLabelTextStyle:
                          TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBook(List<BookModel> items) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: items.map((item) {
          return _buildNewBookItems(item);
        }).toList(),
      ),
    );
  }
}

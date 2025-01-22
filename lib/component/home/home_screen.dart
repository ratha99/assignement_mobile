import 'package:ebook_ui_assignment/component/home/book_data.dart';
import 'package:ebook_ui_assignment/component/library/downloads_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class HomeMenu extends StatefulWidget {
  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildSearch(),
        _buildCategoryView(),
        _buildNewBook(bookModelList, Axis.horizontal), // First book list - Horizontal
        _buildBookaLabel(),
        _buildBook(bookModelList), // Second book list - Vertical
      ],
    );
  }

  Widget _buildCategoryView() {
    return SizedBox(
      height: 90, // Set height based on screen
      child: GridView.builder(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: category.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(category[index]);
        },
      ),
    );
  }

  List<Map<String, dynamic>> category = [
    {"title": "Book", "icon": Icons.headphones},
    {"title": "Audio", "icon": Icons.audio_file}
  ];

  Widget _buildCategoryItem(Map<String, dynamic> item) {
    return Column(
      children: [
        _buildCard(item["title"], item["icon"], DownloadsScreen()),
      ],
    );
  }

  Widget _buildCard(String title, IconData icon, Widget page) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
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

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Widget _buildNewBook(List<BookModel> items, Axis direc) {
    return Column(
      children: [
        SizedBox(
          height: 200, // Provide a fixed height
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: direc, // Use the `Axis` parameter
            itemCount: items.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return _buildNewBookItems(items[index]);
            },
          ),
        ),
        SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _pageController, // Attach the PageController
          count: items.length,         // Total number of pages
          effect: WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildNewBookItems(BookModel items) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items at the top
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
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
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
                  SizedBox(height: 5), // Add some spacing between title and date
                  Text(
                    "Price: USD ${items.price}",
                    style: TextStyle(
                      fontSize: 14, // Adjust font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Add some spacing between title and date
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
    );
  }

  Widget _buildBookaLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Book",
            style: TextStyle(fontSize: 24),
          ),
          TextButton(
            onPressed: () {
              // Add navigation or functionality here
            },
            child: Text("See More"),
          ),
        ],
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

import 'package:ebook_ui_assignment/component/library/downloads_screen.dart';
import 'package:ebook_ui_assignment/modal/category_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
  Widget _buildBody() {
    return  ListView(
      physics: BouncingScrollPhysics(),
      children: [
        _buildSearch(),
        _buildCategoryView(),
        
      ],
      );
  }
  Widget _buildCategoryView() {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.6, // Set height based on screen
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4 / 6,
      ),
      itemCount: category.length,
      itemBuilder: (context, index) {
        return _buildCategoryItem(category[index]);
      },
    ),
  );
}


  // Widget _buildCategoryView() {
  //   return Container(
  //     child: GridView.builder(
  //       physics: BouncingScrollPhysics(),
  //       scrollDirection: Axis.vertical,
  //       padding: EdgeInsets.all(5),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         mainAxisSpacing: 5,
  //         crossAxisSpacing: 5,
  //         childAspectRatio: 4 / 6,
  //       ),
  //       itemCount: category.length,
  //       itemBuilder: (context, index) {
  //         return _buildCategoryItem(category[index]);
  //       },
  //     ),
  //   );
  // }
// List catogory =
 List<Map<String, dynamic>> category = [
    {
      
      "title": "Book",
      "icon": Icons.headphones
    },
    {
      
      "title": "Audio",
      "icon": Icons.audio_file
    }
  ];
Widget _buildCategoryItem(Map<String, dynamic> item) {
    return Column(
      children: [
       _buildCard(item["title"], item["icon"], DownloadsScreen()),        
      ],
    );
  }
   Widget _buildCard(String title, IconData icon, Widget page){
    return Card(
            child: ListTile(
              leading: Icon(icon, ),
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
  
 Widget _buildSearch(){
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
}

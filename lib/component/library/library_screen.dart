import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/component/library/downloads_screen.dart';
import 'package:ebook_ui_assignment/component/library/finished_screen.dart';
import 'package:ebook_ui_assignment/component/library/history_screen.dart';
import 'package:ebook_ui_assignment/component/library/listened_screen.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LibraryScreen extends StatefulWidget {
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  // const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
     Language _lang = Khmer();
    _lang = context.watch<LanguageLogic>().lang;
    return Scaffold(
     
    //  appBar: _buildAppBar(),
      body: _buildBody(_lang),
    );
  }

  // AppBar _buildAppBar() {
  //   return AppBar(
  //     title: Text(
  //       "My Library",
  //       style: TextStyle(color: Colors.black),
  //     ),
  //     backgroundColor: Colors.white,
  //     foregroundColor: Colors.grey,
  //     actions: [
  //       IconButton(
  //         icon: Icon(Icons.favorite_outlined),
  //         onPressed: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => FavoriteScreen()),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  Widget _buildBody(Language _lang) {
   
    return ListView(
      children: [
        // _buildListItem('Listened', '0 items', Icons.headset, ListenedScreen()),
        // _buildListItem(
        //     'Finished', '0 items', Icons.check_sharp, FinishedScreen()),
        // _buildListItem(
        //     'Downloads', '0 items', Icons.download_for_offline_outlined, DownloadsScreen()),
        
        _buildCard(_lang.listened,'0 items', Icons.headset, ListenedScreen()),
        _buildCard(_lang.finish,'0 items', Icons.check_sharp, FinishedScreen()),
        _buildCard(_lang.download,'0 items', Icons.download_for_offline_outlined, DownloadsScreen()),
        _buildMyHistory(_lang,HistoryScreen()),
      ],
    );
  }

  Widget _buildListItem(
      String title, String subtitle, IconData icon, Widget screen) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
      //  color: Colors.white,
        // border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
           // color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }

  Widget _buildMyHistory(Language _lang,Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _lang.history,
            style: TextStyle(fontSize: 16),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screen),
              );
            },
            child: Text(_lang.seemore),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, IconData icon, Widget page){
    return Padding(
      padding:  EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
      child: Card(
       
              child: ListTile(
                leading: Icon(icon),
                title: Text(title),
                subtitle: Text(subtitle),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => page),
                  );
                },
              ),
          ),
    );
  }
}

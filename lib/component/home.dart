import 'package:ebook_ui_assignment/component/home/home_screen.dart';
import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/component/library/favorite_screen.dart';
import 'package:ebook_ui_assignment/component/library/library_screen.dart';
import 'package:ebook_ui_assignment/component/menu/aboutus.dart';
import 'package:ebook_ui_assignment/component/menu/favorite.dart';
import 'package:ebook_ui_assignment/component/menu/notification.dart';
import 'package:ebook_ui_assignment/component/menu/payment_method.dart';
import 'package:ebook_ui_assignment/component/menu/promotion.dart';
import 'package:ebook_ui_assignment/component/menu/user_account.dart';
import 'package:ebook_ui_assignment/component/setting/setting.dart';
import 'package:ebook_ui_assignment/theme/them_logic.dart';
import 'package:ebook_ui_assignment/component/menu.dart';
import 'package:ebook_ui_assignment/component/menu/subscriber.dart';
import 'package:ebook_ui_assignment/language/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Language _lang = Khmer();
  int _langIndex = 0;
   int _currentIndex = 0;
  // const Home_Screen({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().lang;
    _langIndex = context.watch<LanguageLogic>().langIndex;
    final List<Map<String, dynamic>> _tabs = [
    {
      'appBar': AppBar(
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(_lang.title),
                    Text("09287667")
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                    
                   Image.network(
                      'https://cdn-icons-png.flaticon.com/512/149/149071.png',width: 60,),
                  ),
            ],
          ),
        ],
      ),
    },
    {
      'appBar': AppBar(
        title: Text(
          _lang.library,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: IconButton(
                icon: Icon(Icons.favorite_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoriteScreen()),
                  );
                  
                },
              )),
        ],
      )
    },
    {
      'appBar': AppBar(
        title: Image.network(
          'https://cdn-icons-png.flaticon.com/512/149/149071.png',
          width: 60,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: IconButton(
                icon: Icon(Icons.edit_note_outlined, size: 50,),
                onPressed: () {
                  Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => UserAccount()),
                );
                  // showSearch(context: context, delegate: DataSearch());
                },
              )),
        ],
      ),
      
    },
  ];
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.white,
      appBar: _tabs[_currentIndex]['appBar'],
      body: _buildBody(),
      drawer: _currentIndex == 0 ? _buildDrawer() : null,
      bottomNavigationBar:_buildBottomNavBar(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: IndexedStack(
        index: _currentIndex,
        children: [
          HomeMenu(),
          LibraryScreen(),
          MenuScreen(),
          // Pageviewex(),
        ],
      ),
    );
  }



 
  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber.shade300,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: "",
        ),
      ],
    );
  }
  Widget _buildDrawer() {
    ThemeMode mode = context.watch<ThemeLogic>().mode;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                    image: NetworkImage(
                        'https://play-lh.googleusercontent.com/ZpDO2ptHdDO4HZg3EZSIcemFz_iEgrfR2C0L3yjq5vbYrqBjXseCVVLgvv-lrGqr=w240-h480-rw'),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  )),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).drawerTheme.backgroundColor,
            ),
          ),
          _buildCard(_lang.home,Icons.home_outlined, Colors.amber.shade300,HomeScreen()),
          _buildCard(_lang.plan,Icons.subscriptions_outlined,Colors.amber.shade300,Subscriber()),
          _buildCard(_lang.favorite,Icons.favorite_outline,Colors.amber.shade300,Favorite()),
          _buildCard(_lang.discount,Icons.discount_outlined,Colors.amber.shade300,Promotion()),
          _buildCard(_lang.payment,Icons.payment_outlined,Colors.amber.shade300,PaymentMethod()),
          _buildCard(_lang.notification,Icons.notifications_none_outlined,Colors.amber.shade300,NotificationScreen()),
          _buildCard(_lang.aboutUs,Icons.info_outline,Colors.amber.shade300,Aboutus()),
          _buildCard(_lang.setting,Icons.settings,Colors.amber.shade300,SettingScreen()),
        ],
      ),
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

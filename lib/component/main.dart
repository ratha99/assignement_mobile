import 'package:ebook_ui_assignment/component/home.dart';
import 'package:ebook_ui_assignment/component/langguage_translate.dart';
import 'package:ebook_ui_assignment/theme/them_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget providerBasicApp() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguageLogic()),
      ChangeNotifierProvider(create: (context) => ThemeLogic())
    ],
    child: Main_Screen(),
  );
}


class Main_Screen extends StatelessWidget {
  const Main_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = context.watch<ThemeLogic>().mode;
    Color darkColor = Colors.blueGrey.shade900;
    return  MaterialApp(
      home: HomeScreen(),
      themeMode: mode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          toolbarHeight: 80,
          toolbarTextStyle: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 66, 66, 66))
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        cardTheme: const CardTheme(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColor,
          foregroundColor: Colors.white,

          toolbarHeight: 80,
          toolbarTextStyle: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255))
        ),
        drawerTheme:  DrawerThemeData(
         backgroundColor: darkColor,
        ),
        
        cardTheme:  CardTheme(
          color: darkColor,
        ),
      )
      
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.black),
            Text(
              'Welcome,',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Text(
              '092876679',
              style: TextStyle(color: Colors.yellow[700], fontSize: 16),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              radius: 15,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryCard(
                    icon: Icons.headset,
                    label: 'សៀវភៅសំឡេង',
                  ),
                  CategoryCard(
                    icon: Icons.visibility,
                    label: 'បរិភោគ',
                  ),
                ],
              ),
              SizedBox(height: 16),
              SectionHeader(title: 'Audiobook'),
              SizedBox(height: 16),
              AudiobookItem(
                title: 'Title of Audiobook 1',
                subtitle: 'Commentate by Kanika',
                chapters: 9,
                duration: '26.00 Mins',
                isPremium: true,
              ),
              AudiobookItem(
                title: 'Title of Audiobook 2',
                subtitle: 'Commentate by Kanika',
                chapters: 7,
                duration: '20.00 Mins',
                isPremium: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryCard({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 32),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'See More',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

class AudiobookItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int chapters;
  final String duration;
  final bool isPremium;

  const AudiobookItem({
    required this.title,
    required this.subtitle,
    required this.chapters,
    required this.duration,
    required this.isPremium,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey[300],
        ),
        title: Text(title),
        subtitle: Text('$subtitle\n$chapters Chapters · $duration'),
        trailing: isPremium
            ? Chip(
                label: Text('Premium'),
                backgroundColor: Colors.yellow[700],
              )
            : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;
  final screens = [
    Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 60, color: Color(0xFF7055d2)),
      ),
    ),
    Center(
      child: Text(
        'Chats',
        style: TextStyle(fontSize: 60, color: Colors.blueAccent),
      ),
    ),
    Center(
      child: Text(
        'Feed',
        style: TextStyle(fontSize: 60, color: Colors.teal),
      ),
    ),
    Center(
      child: Text(
        'Calls',
        style: TextStyle(fontSize: 60, color: Colors.pink),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Bottom Navigation Bar'),
          centerTitle: true,
          backgroundColor: Color(0xFF7055d2),
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        body: screens[currIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIndex,
          onTap: (index) => setState(() => currIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black,
              //backgroundColor: Color(0xFF7055d2),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Chat',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.personal_video),
              label: 'Feed',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
              backgroundColor: Colors.black,
            ),
          ],
        ),
      );
}

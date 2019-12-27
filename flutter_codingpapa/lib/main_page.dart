import 'package:flutter/material.dart';
import 'package:flutter_codingpapa/screens/feed_page.dart';
import 'package:flutter_codingpapa/screens/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    Container(color: Colors.primaries[1],),
    Container(color: Colors.primaries[2],),
    Container(color: Colors.primaries[3],),
    ProfilePage(),
  ];
//stack 있고 children
  @override
  Widget build(BuildContext context) {
    setState(() {});
    // TODO: implement build
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/home_selected.png",
              iconPath: "assets/home.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/search_selected.png",
              iconPath: "assets/search.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/add.png", iconPath: "assets/add.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/heart_selected.png",
              iconPath: "assets/heart.png"),
          _buildBottomNavigationBarItem(
              activeIconPath: "assets/profile_selected.png",
              iconPath: "assets/profile.png"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }


  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
    });
  }

}


BottomNavigationBarItem _buildBottomNavigationBarItem(
    {String activeIconPath, String iconPath}) {
  return BottomNavigationBarItem(
    activeIcon:
    activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
    icon: ImageIcon(AssetImage(iconPath)),
    title: Text(''),
  );
}


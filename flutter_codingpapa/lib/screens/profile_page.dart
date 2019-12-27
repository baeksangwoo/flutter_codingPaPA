import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size _size;
  double menuWidth;
  int duration=200;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: <Widget>[_sideMenu(), _profile()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _menuOpened = !_menuOpened; //화면이 바뀔 때 마다 바꾸기
          });
        },
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.redAccent,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(_menuOpened ? _size.width-menuWidth : _size.width, 0, 0),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.yellowAccent,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(_menuOpened ? -menuWidth : 0, 0, 0),
    );
  }
}

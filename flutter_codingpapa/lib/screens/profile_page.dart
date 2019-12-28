import 'package:flutter/material.dart';
import 'package:flutter_codingpapa/constants/size.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size _size;
  double menuWidth;
  int duration = 200;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;
    return Scaffold(
      body: Stack(
        children: <Widget>[_sideMenu(), _profile()],
      ),
    );
  }

  Widget _sideMenu() {
    return AnimatedContainer(
      width: menuWidth,
      curve: Curves.easeInOut,
      color: Colors.grey[200],
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
          _menuOpened ? _size.width - menuWidth : _size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child: Text('The beginner Coding'),
                onPressed: null,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      color: Colors.transparent,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(_menuOpened ? -menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(_coloredContainers()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _coloredContainers() {
    return List<Widget>.generate(
        20,
        (i) => Container(
              height: 150,
              color: Colors.primaries[i % Colors.primaries.length],
            ));
  }

  Row _usernameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: common_gap),
                child: Text(
                  'Coding EnEnd',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _menuOpened = !_menuOpened; //화면이 바뀔 때 마다 바꾸기
            });
          },
        )
      ],
    );
  }
}

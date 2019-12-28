import 'package:flutter/material.dart';
import 'package:flutter_codingpapa/constants/size.dart';
import 'package:flutter_codingpapa/utils/profile_image_path.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  double menuWidth;
  int duration = 200;
  AlignmentGeometry tabAlign = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    menuWidth = size.width / 1.5;
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
          _menuOpened ? size.width - menuWidth : size.width, 0, 0),
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
                    delegate: SliverChildListDelegate([
                      _getProfileHeader,
                      _username(),
                      _userbio(),
                      _editProfileButton(),
                      _getTabIconButtons,
                      _getAnimatedSelectedBar
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _editProfileButton() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Padding _userbio() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'Bio from user. so say somthing',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _username() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        'user Real Name',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row get _getProfileHeader => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(getProfileImgPath('theCodingPaPa')),
            ),
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(children: [
                  _getStatusValueWidget('123'),
                  _getStatusValueWidget('12345'),
                  _getStatusValueWidget('1251'),
                ]),
                TableRow(children: [
                  _getStatusLabelWidget('Post'),
                  _getStatusLabelWidget('Followers'),
                  _getStatusLabelWidget('Following'),
                ])
              ],
            ),
          )
        ],
      );

  Widget _getStatusLabelWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_gap),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_gap),
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      );

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

  Widget get _getTabIconButtons => Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage("assets/grid.png")),
              onPressed: () {
                _setTab(true);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage("assets/saved.png")),
              onPressed: () {
                _setTab(false);
              },
            ),
          ),
        ],
      );

  Widget get _getAnimatedSelectedBar => AnimatedContainer(
        alignment: tabAlign,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        color: Colors.transparent,
        height: 1,
        width: size.width,
        child: Container(
          height: 1,
          width: size.width / 2,
          color: Colors.black87,
        ),
      );

  _setTab(bool tabLeft) {
    setState(() {
      if (tabLeft) {
        this.tabAlign = Alignment.centerLeft;
      } else {
        this.tabAlign = Alignment.centerRight;
      }
    });
  }
}

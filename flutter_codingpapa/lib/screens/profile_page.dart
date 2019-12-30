import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_codingpapa/constants/size.dart';
import 'package:flutter_codingpapa/utils/profile_image_path.dart';
import 'package:flutter_codingpapa/widget/profile_side_menu.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _menuOpened = false;
  double menuWidth;
  int duration = 200;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  bool _tabIconGridSelected = true;
  double _girdMargin = 0;
  double _myImgGridMargin = size.width;
  //singleTickerProvider는 frame이 변할 때마다 하나의 애니메이션을 지원한다.

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: duration));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
      color: Colors.grey[duration],
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(
          _menuOpened ? size.width - menuWidth : size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: ProfileSideMenu(),
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
                  ),
                  _getImageGrid(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _getImageGrid(BuildContext context) => SliverToBoxAdapter(
    child: Stack(
      children: <Widget>[
        AnimatedContainer(
          transform: Matrix4.translationValues(_girdMargin, 0, 0),
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          child: _imageGrid,
        ), AnimatedContainer(
          transform: Matrix4.translationValues(_myImgGridMargin, 0, 0),
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          child: _imageGrid,
        ),
      ],
    ),
  );

  GridView get _imageGrid => GridView.count(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 5,
    childAspectRatio: 1,
    children: List.generate(30, (index)=> _gridImgItem(index)
    ),
  );

  CachedNetworkImage _gridImgItem(int index) => CachedNetworkImage(
    fit: BoxFit.cover,
    imageUrl: "https://picsum.photos/id/$index/100/100"
  );

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
          icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
              semanticLabel: "Show Menu",
          ),
          onPressed: () {
            _menuOpened ? _animationController.reverse(): _animationController.forward();
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
              icon: ImageIcon(AssetImage("assets/grid.png"), color: _tabIconGridSelected?Colors.black:Colors.black26,),
              onPressed: () {
                _setTab(true);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: ImageIcon(AssetImage("assets/saved.png"), color: _tabIconGridSelected?Colors.black26:Colors.black,),
              onPressed: () {
                _setTab(false);
              },
            ),
          ),
        ],
      );

  Widget get _getAnimatedSelectedBar => AnimatedContainer(
        alignment: tabAlign,
        duration: Duration(milliseconds: duration),
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
        this._tabIconGridSelected= true;
        this._girdMargin =0;
        this._myImgGridMargin =size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this._tabIconGridSelected= false;
        this._girdMargin = -size.width;
        this._myImgGridMargin =0;
      }
    });
  }
}

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('20억개의 앱'),
      ),
      body: Image.asset('assets/add.png'),
    );
  }
}
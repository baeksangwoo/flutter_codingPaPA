import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null,
            icon: ImageIcon(AssetImage('assets/actionbar_camera.png'),
              color: Colors.black,)),
        title: Image.asset('assets/insta_text_logo.png',height: 30,),
        actions: <Widget>[
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/actionbar_camera.png'),
                color: Colors.black,)),
          IconButton(onPressed: null,
              icon: ImageIcon(AssetImage('assets/direct_message.png'))),
        ],
      ),
      body: ListView.builder(
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) {
            return Container(height: 300,
                color: Colors.primaries[index % Colors.primaries.length]);
          }),
    );
  }
}

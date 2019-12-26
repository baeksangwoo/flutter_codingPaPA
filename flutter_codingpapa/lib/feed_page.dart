import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: null,
            icon: ImageIcon(
              AssetImage('assets/actionbar_camera.png'),
              color: Colors.black,
            )),
        title: Image.asset(
          'assets/insta_text_logo.png',
          height: 30,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: null,
              icon: ImageIcon(
                AssetImage('assets/actionbar_camera.png'),
                color: Colors.black,
              )),
          IconButton(
              onPressed: null,
              icon: ImageIcon(AssetImage('assets/direct_message.png'))),
        ],
      ),
      body: ListView.builder(
          itemCount: 14,
          itemBuilder: (BuildContext context, int index) {
            return _feedItem(index);
          }),
    );
  }
//command + alt + m == method 단축키
  Column _feedItem(int index) {
    return Column(
            children: <Widget>[
              _feedImage(index),
              //문제점: 이미지를 받아와서 보여주다가 다시 생성이 되면 다시 다운받게 된다.
              //캐슁 이미지를 사용해야한다. 메모리 상에 저장하고 하는 것은 라이브러리에서 자동으로 해준다,
            ],
          );
  }

  CachedNetworkImage _feedImage(int index) {
    return CachedNetworkImage(
                imageUrl: 'https://picsum.photos/id/$index/200/200',
                imageBuilder:
                    (BuildContext context, ImageProvider imageProvider) =>
                        AspectRatio(
                          aspectRatio: 2/1, //1/1
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
              );
  }
}

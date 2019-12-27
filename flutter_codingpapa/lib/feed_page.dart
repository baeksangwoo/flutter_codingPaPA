import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codingpapa/utils/profile_image_path.dart';

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
            return _postItem(index);
          }),
    );
  }

//command + alt + m == method 단축키
  Column _postItem(int index) {
    return Column(
      children: <Widget>[
        _postHeader('username $index'),
        _postImage(index),
        Row(
          children: <Widget>[
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/bookmark.png'),
                color: Colors.black87,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/comment.png'),
                color: Colors.black87,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/direct_message.png'),
                color: Colors.black87,
              ),
              onPressed: null,
            ),
            Spacer(),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/heart_selected.png'),
                color: Colors.black87,
              ),
              onPressed: null,
            )
          ],
        )
        //문제점: 이미지를 받아와서 보여주다가 다시 생성이 되면 다시 다운받게 된다.
        //캐슁 이미지를 사용해야한다. 메모리 상에 저장하고 하는 것은 라이브러리에서 자동으로 해준다,
      ],
    );
  }

  Row _postHeader(String username) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(14),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              getProfileImgPath(username),
            ),
            radius: 16,
          ),
        ),
        Expanded(child: Text(username)), //expanded는 남은 자리를 차지한다.
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black87,
          ),
          onPressed: null,
        )
      ],
    );
  }

  CachedNetworkImage _postImage(int index) {
    return CachedNetworkImage(
      imageUrl: 'https://picsum.photos/id/$index/200/200',
      imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
          AspectRatio(
        aspectRatio: 2 / 1, //1/1
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_codingpapa/constants/size.dart';
import 'package:flutter_codingpapa/utils/profile_image_path.dart';

class Comment extends StatelessWidget {

  final String username;
  final bool showProfile;
  final DateTime dateTime;
  final String caption;
  const Comment({Key key,  @required this.username, this.showProfile=false, this.dateTime, @required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(  //보여지게 하는 함
          visible: showProfile,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              getProfileImgPath(username)
            ),
            radius: profile_radius,
          ),
        ),
        Visibility(
            visible: showProfile,
            child: SizedBox(width: common_gap,)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                    style: DefaultTextStyle.of(context).style, //context는 현재 앱의 상태를 가지고 있는 것이다.
                    children: <TextSpan>[                      //현재 어떤 상태인지 가져와 보여주는 것이다.
                      TextSpan(
                          text: username,
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                          text: ''
                      ),
                      TextSpan(
                        text: caption,
                      ),
                    ]
                ),
              ),
              SizedBox(height: common_xs_gap,),
              Visibility(
                  visible: dateTime !=null,
                  child: dateTime == null ? SizedBox() : Text(dateTime.toIso8601String(),style: TextStyle(fontSize: 10,color: Colors.grey[500]),)),
            ],
          ),
        ),
      ],
    );
  }
}

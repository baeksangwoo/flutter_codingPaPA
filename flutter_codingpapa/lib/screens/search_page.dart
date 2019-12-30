import 'package:flutter/material.dart';
import 'package:flutter_codingpapa/constants/size.dart';
import 'package:flutter_codingpapa/utils/profile_image_path.dart';

class SearchPage extends StatelessWidget {

  final List<String> users = List.generate(10, (i)=>'user $i');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context,index){
           return _item(users[index]);
          },
      separatorBuilder: (context,index){
          return Divider(thickness: 1,color: Colors.grey[300],);
      },
      ),
    );
  }

  ListTile _item(String user){
    return ListTile(
      leading: CircleAvatar(
        radius: profile_radius,
        backgroundImage: NetworkImage(getProfileImgPath(user)),
      ),
      title: Text(user),
      subtitle: Text('This is $user bio'),
      trailing: Container(
        height: 30,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.black54,width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Following',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red[700],
          ),
        ),
      ),
    );
  }

}

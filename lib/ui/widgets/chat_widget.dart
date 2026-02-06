import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  String? name;
  String? subName;
  String? time;
  String? image;
  Widget? widget;
  ChatWidget(
      {super.key,
      required this.name,
        required this.widget,
      required this.subName,
      required this.image,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation:1,
      child: ListTile(
        leading: CircleAvatar(
          radius: 35,
          backgroundImage:AssetImage(image ??
              'assets/images/6392c33e90defd2707cbb4cf5f9a63be9f9df0b3.jpg',),),
        title: Row(
          children: [Text(name!,style: TextStyle(fontWeight: FontWeight.w600),), Spacer(), Text(time ?? '')],
        ),
        subtitle: Row(
          children: [
            Text(subName ?? ''),Spacer(),widget??Text('')
          ],
        ),
      ),
    );
  }
}

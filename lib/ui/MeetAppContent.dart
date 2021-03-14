import 'package:flutter/material.dart';

class MeetAppContent extends StatefulWidget {
  final String imageAsset;
  final String title;
  final Widget description;

  MeetAppContent({Key key, this.description, this.title, this.imageAsset})
      : super(key: key);

  _MeetAppContent createState() => _MeetAppContent();
}

class _MeetAppContent extends State<MeetAppContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage(widget.imageAsset), width: 250),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(widget.title, style: TextStyle(fontSize: 23)),
        ),
        widget.description,
      ],
    );
  }
}
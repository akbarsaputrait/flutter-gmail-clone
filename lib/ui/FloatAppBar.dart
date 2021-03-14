import 'package:flutter/material.dart';

class MailFloatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 35,
          right: 15,
          left: 15,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  elevation: 10,
                  child: IconButton(
                    splashColor: Colors.grey,
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        hintText: "Search in mail"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(9),
                  width: 33,
                  height: 33,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://krs.umm.ac.id/Poto/2019/201910370311145.JPG'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MeetFloatAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 35,
      right: 15,
      left: 15,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Material(
              type: MaterialType.transparency,
              elevation: 10,
              child: IconButton(
                splashColor: Colors.grey,
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
            Text('Meet', style: TextStyle(fontSize: 20)),
            Container(
              margin: EdgeInsets.all(9),
              width: 33,
              height: 33,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://krs.umm.ac.id/Poto/2019/201910370311145.JPG'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

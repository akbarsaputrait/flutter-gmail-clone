import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Google Sans'),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [MailApp(), MeetApp()];

    return Scaffold(
        body: _children[_currentIndex],
        // body: MeetApp(),
        floatingActionButton: _currentIndex == 0
            ? FloatingActionButton.extended(
                onPressed: () {},
                label: Text(
                  'Compose',
                  style: TextStyle(color: Colors.red),
                ),
                icon: Icon(
                  Icons.edit_outlined,
                  color: Colors.red,
                ),
                backgroundColor: Colors.white,
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.email_outlined),
              activeIcon: Icon(Icons.email),
              label: 'Mail',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam_outlined),
              activeIcon: Icon(Icons.videocam),
              label: 'Meet',
              backgroundColor: Colors.green,
            ),
          ],
          selectedItemColor: Colors.red,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
        ));
  }
}

class MailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 70),
          child: ListView(
            children: [
              ListItem(
                  name: 'Quora Digest',
                  time: '8 Mar',
                  color: Colors.red,
                  title:
                      'Why are programming jobs declining and are there any jobs left?',
                  description:
                      'Answer: Estimate for the number of unfilled programming jobsb in the United States range from a low of 220,000 to a high of 1,000,000.'),
              ListItem(
                  name: 'Google',
                  time: '23 Feb',
                  color: Colors.purple,
                  title: 'Security Alert',
                  description:
                      'Sharer.pw Drive File Sharer was granted access to your Google Account.'),
            ],
          ),
        ),
        MailFloatAppBar(),
      ],
    );
  }
}

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

class ListItem extends StatefulWidget {
  final Color color;
  final String name;
  final String time;
  final String title;
  final String description;

  ListItem(
      {Key key, this.color, this.name, this.time, this.description, this.title})
      : super(key: key);

  _ListItem createState() => _ListItem();
}

class _ListItem extends State<ListItem> {
  @override
  Widget build(BuildContext contenxt) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${widget.name.substring(0, 1)}'),
          backgroundColor: widget.color,
        ),
        title: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  widget.time,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.only(top: 8, right: 30),
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
              ],
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: new Container(
                padding: new EdgeInsets.all(0),
                child: new Text(
                  widget.description,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
            Icon(Icons.star_border)
          ],
        ),
      ),
    );
  }
}

class MeetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MeetApp();
  }
}

class _MeetApp extends State<MeetApp> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [
      MeetAppContent(
          title: 'Get a link you can share',
          imageAsset: 'assets/images/conference_call.png',
          description: DescriptionContent1()),
      MeetAppContent(
          title: 'Your meeting is safe',
          imageAsset: 'assets/images/security.png',
          description: DescriptionContent2())
    ];

    return Stack(
      children: [
        MeetFloatAppBar(),
        Center(
          child: Container(
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 16 / 10,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: contents,
                ),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: contents.map((url) {
            int index = contents.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget DescriptionContent1() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 14.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text:
                    'No one can join a meeting unless invited or admitted by the host'),
          ],
        ),
      ),
    );
  }

  Widget DescriptionContent2() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 14.0, color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: 'To'),
            TextSpan(
                text: ' New Meeting ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(
                text:
                    'to get a link you can send to people you want to meet with'),
          ],
        ),
      ),
    );
  }
}

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

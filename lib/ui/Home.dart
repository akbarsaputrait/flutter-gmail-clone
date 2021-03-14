import 'package:flutter/material.dart';
import 'package:gmail_clone_app/ui/MailApp.dart';
import 'package:gmail_clone_app/ui/MeetApp.dart';

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
        endDrawerEnableOpenDragGesture: false,
        body: _children[_currentIndex],
        drawer: Drawer(),
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

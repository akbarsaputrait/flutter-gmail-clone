import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gmail_clone_app/ui/FloatAppBar.dart';
import 'package:gmail_clone_app/ui/MeetAppContent.dart';

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
              height: 400,
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 1,
                          viewportFraction: 1.0,
                          enableInfiniteScroll: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                      items: contents,
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
                )
              )),
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
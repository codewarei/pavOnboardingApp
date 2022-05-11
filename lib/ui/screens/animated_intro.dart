import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  List pageInfos = [
    {
      "title": "We would love to know more about you",
      "body": "Please fill the form, we would like to get to know you more. ",
      "img": "data:image/jpeg;base64,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",
    },
    {
      "title": "Live Meeting",
      "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
      "img": "https://smartkit.wrteam.in/smartkit/images/on2.png",
    },
    {
      "title": "Wedding",
      "body": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
      "img": "https://smartkit.wrteam.in/smartkit/images/on3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [for (int i = 0; i < pageInfos.length; i++) _buildPageModel(pageInfos[i])];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: IntroductionScreen(
        pages: pages,
        dotsDecorator: const DotsDecorator(
          activeColor: Colors.redAccent,
        ),
        onDone: () {
          Navigator.pop(context);
        },
        onSkip: () {
          Navigator.pop(context);
        },
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.grey,
          ),
        ),
        next: const Text(
          "Next",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.blue,
          ),
        ),
        done: Container(
          padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
          decoration: BoxDecoration(
            color: Colors.pink[300],
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: const Text(
            "Done",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _buildPageModel(Map item) {
    return PageViewModel(
      titleWidget: Text(item['title'],
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          )),
      body: item['body'],
      image: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: CachedNetworkImage(
          imageUrl: item['img'],
        ),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).accentColor,
        ),
        bodyTextStyle: const TextStyle(fontSize: 15.0, color: Colors.grey),
//        ),
        pageColor: Colors.white,
      ),
    );
  }
}

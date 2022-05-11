import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_1.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_2.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_3.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_4.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_5.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_6.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_7.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_8.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_login.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_survey_1.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_survey_2.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/slide_survey_3.dart';

import '../../core/constant/slideanimation.dart';


class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> with SingleTickerProviderStateMixin {
  late String svg1;
  late PageController _pageController;
  late AnimationController _animationController;
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  // Will print error messages to the console.
  final String assetName = 'https://smartkit.wrteam.in/smartkit/images/intro1.svg';
  late Widget svg;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    // _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
    // svg1 = 'https://smartkit.wrteam.in/smartkit/images/1intro.svg';
    svg = SvgPicture.network(
      assetName,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> indicators = [];
  void onAddButtonTapped(int index) {
    // use this to animate to the page
    _pageController.animateToPage(index, duration: const Duration(milliseconds: 1000), curve: Curves.elasticInOut);

    // or this to jump to it without animating
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 50.0,
                child: GestureDetector(
                  onTap: () {
                    // _animationController.dispose();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Container(),
                      ),
                    );
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              IntroPage1(
                svg1: svg,
              ),
              const IntroPage2(),
              Survey1(),
              const IntroPage3(),
              const IntroPage4(),
              Survey2(),
              const IntroPage5(),
              const IntroPage6(),
              Survey3(),
              const IntroPage7(),
              const IntroPage8(),
              const IntroLogin(),

            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 80, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: _buildIndicator(),
            ),
          ),
          InkWell(
            onTap: () {
              if (currentIndex == 0) {
                setState(() {
                  indicators.add(_indicator(true));

                  currentIndex = 1;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 1) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 2;
                  onAddButtonTapped(currentIndex);
                });
              }else if (currentIndex == 2) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 3;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 3) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 4;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 4) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 5;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 5) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 6;
                  onAddButtonTapped(currentIndex);
                });
              }else if (currentIndex == 6) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 7;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 7) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 8;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 8) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 9;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 9) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 10;
                  onAddButtonTapped(currentIndex);
                });
              } else if (currentIndex == 10) {
                setState(() {
                  indicators.add(_indicator(true));
                  currentIndex = 11;
                  onAddButtonTapped(currentIndex);
                });
              }  else if (currentIndex == 11) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Container(),
                  ),
                );
              }
            },
            child: Container(
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == 0
                      ? "Next"
                      : currentIndex == 1
                      ? "Next"
                      : currentIndex == 2
                      ? "Next"
                      : currentIndex == 3
                      ? "Next"
                      : currentIndex == 4
                      ? "Next"
                      : currentIndex == 5
                      ? "Next"
                      : currentIndex == 6
                      ? "Next"
                      : currentIndex == 7
                      ? "Next"
                      : currentIndex == 8
                      ? "Next"
                      : currentIndex == 9
                      ? "Next"
                      : currentIndex == 10
                      ? "Next"
                      : "Start Now",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.blue, Colors.blue])),
            ),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 15 : 5,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // gradient:
          // LinearGradient(begin: Alignment.centerLeft,
          // end: Alignment.centerRight, colors: [color1, color1]),
          color: isActive ? Colors.blue : Colors.cyan,
        ));
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 10; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}







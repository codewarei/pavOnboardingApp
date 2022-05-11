

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/slideanimation.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({
    Key ? key,
  }) : super(key: key);

  @override
  _IntroPage3State createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SlideAnimation(slideDirection: SlideDirection.fromRight, itemCount: 2, animationController: _animationController, position: 1, child:   Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                ),),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 3,
            animationController: _animationController,
            position: 2,
            child: Row(
              children: [
                Container(
                  decoration:  const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 4.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Driving engagement\nlearning efficiency ",
                      style: TextStyle(color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),

                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SlideAnimation(
            slideDirection: SlideDirection.fromRight,
            itemCount: 4,
            animationController: _animationController,
            position: 3,
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "PAV Telecoms is very proud of what it stands for."
                    "We believe that our Brand, our Values and our Promise are what have made us and the people who work with use successful."
                    " It is therefore important that we share these with you."
                    "    It is equally important that we give you the tools that you need to achieve your own successes."
                    " PAV Connect will connect you to these tools and to ",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          // SlideAnimation(
          //   slideDirection: SlideDirection.fromRight,
          //   itemCount: 4,
          //   animationController: _animationController,
          //   position: 3,
          //   child: Container(
          //     alignment: Alignment.centerLeft,
          //     child:  Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: SlideAnimation(slideDirection: SlideDirection.fromRight, itemCount: 2, animationController: _animationController, position: 1, child:   Image.asset(
          //         'images/logo.png',
          //         width: 300,
          //       ),),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
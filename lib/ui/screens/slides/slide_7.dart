import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/slideanimation.dart';

class IntroPage7 extends StatefulWidget {
  const IntroPage7({
    Key ? key,
  }) : super(key: key);

  @override
  _IntroPage7State createState() => _IntroPage7State();
}

class _IntroPage7State extends State<IntroPage7> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
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
                  decoration: const BoxDecoration(
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
                      "PAV Connect Overview",
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
                "This is an introduction to PAV Connect and a brief discussion on what the user will be able to do."

    "The rest of the on-boarding takes the user through the functionality and how and when to use it",
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/slideanimation.dart';

class IntroPage8 extends StatefulWidget {
  const IntroPage8({
    Key? key,
  }) : super(key: key);

  @override
  _IntroPage8State createState() => _IntroPage8State();
}

class _IntroPage8State extends State<IntroPage8> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
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
                child: SlideAnimation(
                  slideDirection: SlideDirection.fromRight,
                  itemCount: 2,
                  animationController: _animationController,
                  position: 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 300,
                  ),
                ),
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
                      "PAV Connect Product “how to”,",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "My Profile"
                    "Communities\n"
                    "Connect\n"
                    "Recognition\n",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "NOTE:\n"
                    "The Engage workshop will define what communities we have and who has access and the level of access"
                    "Recognition will be discussed in greater detail and “categories” agreed",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
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

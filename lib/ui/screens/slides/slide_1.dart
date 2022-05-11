import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/slideanimation.dart';

class IntroPage1 extends StatefulWidget {
  final Widget svg1;

  IntroPage1({
    required this.svg1,
  });

  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> with TickerProviderStateMixin {
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
              SlideAnimation(
                slideDirection: SlideDirection.fromRight,
                itemCount: 2,
                animationController: _animationController,
                position: 1,
                child: Container(
                  height: 360,
                  width: 600,
                  child: Form(
                    child:
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Column(
                        //     children: <Widget>[
                        //       TextFormField(
                        //         keyboardType: TextInputType.text,
                        //         textInputAction: TextInputAction.next,
                        //
                        //         decoration: const InputDecoration(
                        //           hintText: 'Where were you born ?',
                        //           labelText: 'Where were you born ',
                        //         ),
                        //       ),
                        //       TextFormField(
                        //         keyboardType: TextInputType.phone,
                        //         textInputAction: TextInputAction.next,
                        //
                        //         decoration: const InputDecoration(
                        //           hintText: 'Do you have children ?',
                        //           labelText: 'Do you have children ',
                        //         ),
                        //       ),
                        //       TextFormField(
                        //         keyboardType: TextInputType.text,
                        //         textInputAction: TextInputAction.next,
                        //
                        //         decoration: const InputDecoration(
                        //           hintText: 'What are your interests',
                        //           labelText: 'What are your interests',
                        //         ),
                        //       ),
                        //       TextFormField(
                        //         keyboardType: TextInputType.text,
                        //         textInputAction: TextInputAction.done,
                        //         decoration: const InputDecoration(
                        //           hintText: 'What do you do on weekends',
                        //           labelText: 'What do you do on weekends',
                        //         ),
                        //       ),
                        //       const SizedBox(height: 10,),
                        //       ElevatedButton(
                        //         onPressed: () {  },
                        //         child: const Text('Submit'),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                      // margin: const EdgeInsets.only(
                      //     right: 10, left: 26),
                      elevation: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: 'Where were you born ?',
                                    labelText: 'Where were you born ',
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: 'Do you have children ?',
                                    labelText: 'Do you have children ',
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    hintText: 'What are your interests',
                                    labelText: 'What are your interests',
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    hintText: 'What do you do on weekends',
                                    labelText: 'What do you do on weekends',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Submit'),
                                ),
                              ],
                            ),
                            // Container(
                            //   margin: const EdgeInsets.only(top: 160),
                            //   width: double.maxFinite,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Text(
                            //       'Metthew',
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .subtitle2
                            //           ?.copyWith(color: Colors.white),
                            //       textAlign: TextAlign.center,
                            //     ),
                            //   ),
                            //   color: Colors.black26,
                            // ),
                          ],
                        ),
                      ),
                    ),
                        ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
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
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "We would love \nto know more about you",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
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
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Please fill the form",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

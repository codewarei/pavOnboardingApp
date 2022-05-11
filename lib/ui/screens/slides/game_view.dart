import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/slideanimation.dart';
import '../../shared/const_color.dart';

class GameView extends StatefulWidget {
  const GameView({
    Key ? key,
  }) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with TickerProviderStateMixin {
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

    const numberQueen = '*120*5455#';
    const numberLucky = '*120*1310#';

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
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
                        "Gaming",
                        style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
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
                      "Please select a card and stand a chance to win Airtime",

                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              launch('tel://$numberQueen');
                            },
                            child: Card(
                                elevation: 20,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:  const SizedBox(
                                  width: 200,
                                  height: 100,
                                  child:
                                  Center(child: Text('Queens of Heart', style: TextStyle(fontSize: 20))),
                                )),
                          ),
                        ),
                        const Text('1 Queen R12 Airtime'),
                        const Text('2 Queen R29 Airtime'),
                        const Text('3 Queen R55 Airtime'),
                        const Text('4 Queen R110 Airtime'),
                        const Text('4 Queen R275 Airtime'),
                        const SizedBox(height: 25,),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              launch('tel://$numberLucky');
                            },
                            child: Card(
                                elevation: 20,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const SizedBox(
                                  width: 200,
                                  height: 100,
                                  child:
                                  Center(child: Text('Lucky Seven', style: TextStyle(fontSize: 20, color: Colors.white),)),
                                )),
                          ),
                        ),
                        const Text('1 Seven R12 Airtime'),
                        const Text('2 Seven R29 Airtime'),
                        const Text('3 Seven R55 Airtime'),
                        const Text('4 Seven R110 Airtime'),
                        const Text('4 Seven R275 Airtime'),

                        // const SizedBox(
                        //   height: 20,
                        // ),

                        // Text("Signin to continue with your mobile number",
                        //     textAlign: TextAlign.center,
                        //     style: Theme.of(context).textTheme.subtitle2?.merge(
                        //       TextStyle(
                        //         color: Colors.white,
                        //         letterSpacing: 1.35,
                        //         fontWeight: FontWeight.w400,
                        //       ),
                        //     )),

                        // Container(
                        //     alignment: Alignment.center,
                        //     padding: const EdgeInsets.all(10),
                        //     child: const Text(
                        //       'Sign in',
                        //       style: TextStyle(fontSize: 20),
                        //     )),
                        // const SizedBox(height: 40,),
                        // Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        //     child: ElevatedButton(
                        //       child: const Text('Login'),
                        //       onPressed: () {
                        //         launch('tel://$number');
                        //       },
                        //     )
                        // ),
                      ],
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
      ),
    );
  }
}
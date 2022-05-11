import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constant/slideanimation.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({
    Key ? key,
  }) : super(key: key);

  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> with TickerProviderStateMixin {


  final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'DbVv4EUHw3c',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      )
  );

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
    String intro2 = 'https://images.unsplash.com/photo-1638913971251-832d29947de6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw5MHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60';

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
                      "Message from \nMathew",
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
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Matthew Francis is the MD of Pav Telecoms, "
                          "Matthew has been the driving force behind the company since its inception 16 years ago. "
                          "Mathew started the company selling sim from the boot of his car in Hillbrow. "
                          "Today Pav is the most successful. This is what Pav's entrepreneurial revolution is all about"
                          "giving everyone the opportunity to Belong and Become",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                    elevation: 15,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                          YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.blueAccent,
                        ),

                            Container(
                              margin: const EdgeInsets.only(top: 160),
                              width: double.maxFinite,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Metthew',
                                  style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     height: 200,
                  //     width: 300,
                  //     child: YoutubePlayer(
                  //       controller: _controller,
                  //       showVideoProgressIndicator: true,
                  //       progressIndicatorColor: Colors.blueAccent,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
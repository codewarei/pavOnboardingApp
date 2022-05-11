import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/slideanimation.dart';

class Survey2 extends StatefulWidget {
  @override
  _Survey2State createState() => _Survey2State();
}

class _Survey2State extends State<Survey2> with TickerProviderStateMixin {
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

  List<Map> availableHobbies = [
    {"name": "Foobball", "isChecked": false},
    {"name": "Baseball", "isChecked": false},
    {
      "name": "Video Games",
      "isChecked": false,
    },
    // {"name": "Readding Books", "isChecked": false},
    // {"name": "Surfling The Internet", "isChecked": false}
  ];

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
                  height: 290,
                  width: 300,
                  child: Form(
                    child: Padding(
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child:
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                                        // The checkboxes will be here
                                        Column(
                                            children: availableHobbies.map((hobby) {
                                              return CheckboxListTile(
                                                  value: hobby["isChecked"],
                                                  title: Text(hobby["name"]),
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      hobby["isChecked"] = newValue;
                                                    });
                                                  });
                                            }).toList()),

                                        // Display the result here
                                        const SizedBox(height: 10),
                                        // const Divider(),
                                        const SizedBox(height: 10),

                                      ]),
                                    ),
                                  )
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
          const SizedBox(
            height: 15,
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
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Please Answer\nthe above question",
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
                "Lorem Ipsum is simply dummy, Lorem Ipsum is simply  ",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: availableHobbies.map((hobby) {
              if (hobby["isChecked"] == true) {
                return Card(
                  elevation: 3,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(hobby["name"]),
                  ),
                );
              }

              return Container();
            }).toList(),
          )
        ],
      ),
    );
  }
}



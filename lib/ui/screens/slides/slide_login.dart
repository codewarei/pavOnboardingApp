import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides/game_view.dart';

import '../../../core/constant/slideanimation.dart';
import '../../shared/const_color.dart';

class IntroLogin extends StatefulWidget {
  const IntroLogin({
    Key ? key,
  }) : super(key: key);

  @override
  _IntroLoginState createState() => _IntroLoginState();
}

class _IntroLoginState extends State<IntroLogin> with TickerProviderStateMixin {
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
                      "Thank You",
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
                    "Please Login",

                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

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
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const TextField(
                          // controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: const TextField(
                          obscureText: true,
                          // controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text('Forgot Password',),
                      ),
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const GameView()));
                            },
                          )
                      ),
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
    );
  }
}
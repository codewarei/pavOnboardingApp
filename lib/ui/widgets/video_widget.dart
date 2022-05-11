import 'package:easy_onboarding/easy_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  EasyOnboarding(
      onStart: () {
        print("getting started ");
      },
      skipButtonColor: Colors.transparent,
      backButtonColor: Colors.deepPurple,
      nextButtonColor: Colors.deepPurple,
      backgroundColor: Colors.white,
      indicatorSelectedColor: Colors.blue,
      indicatorUnselectedColor: Colors.blueGrey,
      startButtonColor: Colors.blue,
      nextButtonIcon: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      skipButtonText: Text(
        'SKIP',
        style: TextStyle(fontSize: 15.0, color: Colors.blue[900]),
      ),
      startButtonText: const Text(
        'GETTING STARTED',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
      backButtonIcon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: const Icon(
                  Icons.phone_android,
                  size: 300,
                  color: Color(0xFF679CF8),
                ),
              ),
              const Text(
                'We would love to know more about you',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                "Easy to use.",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Container(
                child: const Icon(
                  Icons.phone_android,
                  size: 300,
                  color: Color(0xFF679CF8),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [

              Container(
                child: const Icon(
                  Icons.thumb_up,
                  size: 300,
                  color: Color(0xFF679CF8),
                ),
              ),
              const Text(
                'Try it.',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                "Easy to customize.",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: const Icon(
                  Icons.color_lens,
                  size: 300,
                  color: Color(0xFF679CF8),
                ),
              ),
              const Text(
                'Fully customizable',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                "Change colors",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: const Icon(
                  Icons.widgets,
                  size: 300,
                  color: Color(0xFF679CF8),
                ),
              ),
              const Text(
                'Add your own widgets',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                "No restriction",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: const Icon(
                  Icons.cloud_download,
                  size: 300,
                  color: Color(0xFF679CF8),
                ),
              ),
              const Text(
                'Install easy_onboarding',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                "Created by Dicksen",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
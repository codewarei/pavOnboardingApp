import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatelessWidgetDemo extends StatelessWidget {
  final keyIsFirstLoaded = 'is_first_loaded';


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter Stateless Demo'),
            ),
            body: const Center(
              child: Text('Hello'),
            )));
  }

  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            elevation: 10,
            content: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/pop.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
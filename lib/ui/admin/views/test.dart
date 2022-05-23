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
            content: Container(
              height: 1000,
              width: 800,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/pa.jpg',
                      height: 1000,
                    // width: 800,
                    fit: BoxFit.cover,
                  ),
                  const Text('This is a Dummy\n Text for the user\n\nto see for now Ad\nto see for now Ad\n\n\nto see for now Ad\nto see for now Ad\nto see for now Ad', style: TextStyle(color: Colors.white, fontSize: 35),),
                  Positioned(
                    top: 1,
                    right: 20,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.clear),
                      tooltip: 'Close the AD',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
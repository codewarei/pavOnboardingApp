import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/nav_drawer_widget.dart';

class SurveyView extends StatefulWidget {
  const SurveyView({Key? key}) : super(key: key);

  @override
  State<SurveyView> createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Survey'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(child: const Text('Survey')),
    );
  }
}

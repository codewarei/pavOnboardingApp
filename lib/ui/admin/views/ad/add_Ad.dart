import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/kConst.dart';
import '../../widgets/textformfield_widget.dart';

class AddAd extends StatefulWidget {
  const AddAd({Key? key}) : super(key: key);

  @override
  State<AddAd> createState() => _AddAdState();
}

class _AddAdState extends State<AddAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Add Ad'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 200,
                child: const Text(
                  'ADD AD',
                  textAlign: TextAlign.center,
                  style: loginTitle,
                ),
              ),
              const SizedBox(height: 20),
              const TextFormWidget(
                  hint: 'Add Ad'),
              const SizedBox(height: 400),
              const ButtonWidget(
                text: 'SUBMIT',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/kConst.dart';
import '../../widgets/textformfield_widget.dart';

class AddAnswer extends StatefulWidget {
  const AddAnswer({Key? key}) : super(key: key);

  @override
  State<AddAnswer> createState() => _AddAnswerState();
}

class _AddAnswerState extends State<AddAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Add Answer'),
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
                  'ADD ANSWER',
                  textAlign: TextAlign.center,
                  style: loginTitle,
                ),
              ),
              const SizedBox(height: 20),
              const TextFormWidget(
                 hint: 'Answer 1'),
              const TextFormWidget(hint: 'Answer 2'),
              const TextFormWidget(
                  hint: 'Answer 3'),

              const SizedBox(height: 200),
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
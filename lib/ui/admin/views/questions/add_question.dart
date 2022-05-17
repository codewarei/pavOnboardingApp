import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/kConst.dart';
import '../../widgets/textformfield_widget.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Add Question'),
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
                  'ADD QUESTION',
                  textAlign: TextAlign.center,
                  style: loginTitle,
                ),
              ),
              const SizedBox(height: 20),
              const TextFormWidget(
                  hint: 'Question 1'),
              const TextFormWidget(hint: 'Question 2'),
              const TextFormWidget(
                  hint: 'Question 3'),

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
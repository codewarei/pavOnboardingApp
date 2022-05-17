import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/kConst.dart';
import '../../widgets/textformfield_widget.dart';

class AddQuestionnaire extends StatefulWidget {
  const AddQuestionnaire({Key? key}) : super(key: key);

  @override
  State<AddQuestionnaire> createState() => _AddQuestionnaireState();
}

class _AddQuestionnaireState extends State<AddQuestionnaire> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Add Questionnaire'),
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
                  'ADD QUESTIONNAIRE',
                  textAlign: TextAlign.center,
                  style: loginTitle,
                ),
              ),
              const SizedBox(height: 20),
              const TextFormWidget(
                  hint: 'Questionnaire 1'),
              const TextFormWidget(hint: 'Questionnaire 2'),
              const TextFormWidget(
                  hint: 'Questionnaire 3'),
              const TextFormWidget(
                  hint: 'Questionnaire 4'),

              const SizedBox(height: 40),
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
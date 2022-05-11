import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/slideanimation.dart';

class Survey1 extends StatefulWidget {
  @override
  _Survey1State createState() => _Survey1State();
}

class _Survey1State extends State<Survey1> with TickerProviderStateMixin {
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

  bool _isRadioSelected = false;

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
                  height: 160,
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
                                children: <LabeledRadio>[
                                  LabeledRadio(
                                    label: 'Answer 1',
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    value: true,
                                    groupValue: _isRadioSelected,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        _isRadioSelected = newValue;
                                      });
                                    },
                                  ),
                                  LabeledRadio(
                                    label: 'Answer 2',
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    value: false,
                                    groupValue: _isRadioSelected,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        _isRadioSelected = newValue;
                                      });
                                    },
                                  ),
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
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

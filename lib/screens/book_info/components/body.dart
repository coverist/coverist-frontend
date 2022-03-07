import 'dart:ui';

import 'package:flutter/material.dart';
import 'info_title.dart';
import 'info_tag.dart';
import 'info_genre_main.dart';
import 'image_view.dart';

import 'package:coverist/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      currentStep: _index,
      controlsBuilder: (context, ControlsDetails details) {
        return Row(
          children: <Widget>[
            OutlinedButton(
              onPressed: details.onStepCancel,
              child: const Text('이전으로'),
            ),
            TextButton(
              onPressed: details.onStepContinue,
              child: const Text('다음'),
            ),
          ],
        );
      },
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
            print(_index);
          });
        }
      },
      onStepContinue: () {
        if (_index <= 3) {
          setState(() {
            _index += 1;
            print(_index);
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
          print(_index);
        });
      },
      steps: <Step>[
        Step(
            title: const Text('Step 1 제목&저자명'),
            content: InfoTitle(),
            isActive: _index > 0,
            state: StepState.complete),
        Step(
            title: Text('Step 2 태그'),
            content: InfoTag(),
            isActive: _index > 1,
            state: StepState.complete),
        Step(
            title: Text('Step 3 장르'),
            content: InfoGenre(),
            isActive: _index > 2,
            state: StepState.complete),
        Step(
            title: Text('Step 4 '),
            content: InfoGenre(),
            isActive: _index > 3,
            state: StepState.complete),
      ],
    );
  }
}
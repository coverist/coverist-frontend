import 'package:flutter/material.dart';

import 'info_title.dart';
import 'info_tag.dart';
import 'info_genre_main.dart';
import 'info_publisher.dart';

import '/widgets/book_info/step_button_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _index = 0;
  String? stepText = '다음';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stepper(
      type: StepperType.horizontal,
      currentStep: _index,
      controlsBuilder: (context, ControlsDetails details) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StepButton(
                step: _index,
                onPressedPrev: details.onStepCancel!,
                onPressedNext: details.onStepContinue!),
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
        String inputText = '';

        if (_index <= 3) {
          setState(() {
            _index += 1;
            print(_index);

            print("stepText body : " + stepText!);
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
            title: StepText('제목&저자명', 0),
            content: InfoTitle(),
            isActive: _index > 0,
            state: StepState.complete),
        Step(
            title: StepText('장르', 0),
            content: InfoGenre(),
            isActive: _index > 1,
            state: StepState.complete),
        Step(
            title: StepText('태그', 0),
            content: InfoTag(),
            isActive: _index > 2,
            state: StepState.complete),
        Step(
            title: StepText('출판사', 20),
            content: InfoLogo(),
            isActive: _index > 3,
            state: StepState.complete),
      ],
    ));
  }

  StepText(String str, double rPad) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, rPad, 0),
        child: Text(
          str,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            // fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ));
  }
}

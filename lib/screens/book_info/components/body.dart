import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_title.dart';
import 'info_tag.dart';
import 'info_genre_main.dart';
import 'info_publisher.dart';

import '/widgets/book_info/step_button_widget.dart';
import 'package:coverist/models/provider.dart';

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
            ElevatedButton(
                onPressed: details.onStepCancel,
                child: Text('  이전  '),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return TextStyle(color: Colors.white);
                  } else {
                    return TextStyle(color: Color(0xFFbcabd2));
                  }
                }), foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  } else {
                    return Color(0xFFbcabd2);
                  }
                }), backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color(0xFFbcabd2);
                  } else {
                    return Colors.white;
                  }
                }))),
            SizedBox(width: 420),
            ElevatedButton(
                onPressed: _index == 3
                    ? () async {
                        context.read<BookInfo>().sendProvider();
                        print("send clicked");
                      }
                    : details.onStepContinue,
                child: Text('   ' + (_index == 3 ? '표지 만들기' : '다음') + '   '),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states) {
                  // disabled : onpressed가 null일때 , pressed : 클릭됐을때
                  if (states.contains(MaterialState.pressed)) {
                    return TextStyle(color: Color(0xFFbcabd2));
                  } else {
                    return TextStyle(color: Colors.white);
                  }
                }), foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color(0xFFbcabd2);
                  } else {
                    return Colors.white;
                  }
                }), backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  } else {
                    return Color(0xFFbcabd2);
                  }
                })))
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
        // int page = context.read<BookInfo>().nullCheck();
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
            title: const Text('Step 1 제목&저자명'),
            content: InfoTitle(),
            isActive: _index > 0,
            state: StepState.complete),
        Step(
            title: Text('Step 2 장르'),
            content: InfoGenre(),
            isActive: _index > 1,
            state: StepState.complete),
        Step(
            title: Text('Step 3 태그'),
            content: InfoTag(),
            isActive: _index > 2,
            state: StepState.complete),
        Step(
            title: Text('Step 4 출판사'),
            content: InfoLogo(),
            isActive: _index > 3,
            state: StepState.complete),
      ],
    ));
  }
}

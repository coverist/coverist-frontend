import 'package:flutter/material.dart';

class StepGuideText extends StatefulWidget {
  final String mainText;
  final String subText;

  const StepGuideText({Key? key, required this.mainText, required this.subText})
      : super(key: key);

  @override
  _StepGuideTextState createState() =>
      _StepGuideTextState(mainText: mainText, subText: subText);
}

class _StepGuideTextState extends State<StepGuideText> {
  String mainText;
  String subText;

  _StepGuideTextState({required this.mainText, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(mainText,
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5)),
        SizedBox(height: 10),
        Text(subText,
            style: TextStyle(
                fontSize: 14, color: Colors.white, letterSpacing: 1.5)),
        const SizedBox(height: 80),
      ],
    );
  }
}

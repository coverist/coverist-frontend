import 'package:flutter/material.dart';

import '/widgets/book_info/input_text_widget.dart';
import 'package:coverist/widgets/book_info/stepguide_text_widget.dart';

import 'package:coverist/constants.dart';

class InfoTitle extends StatefulWidget {
  const InfoTitle({Key? key}) : super(key: key);

  @override
  _InfoTitleState createState() => _InfoTitleState();
}

class _InfoTitleState extends State<InfoTitle> {
  List inputList = ["제목", "저자명"];

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: (MediaQuery.of(context).size.height) * kBookInfoHeight,
        width: (MediaQuery.of(context).size.width) * kBookInfoWidth,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepGuideText(mainText: '제목과 저자명을 입력해주세요', subText: ''),
              InputText(
                string: inputList[0],
              ),
              SizedBox(height: 60),
              InputText(
                string: inputList[1],
              )
            ]),
      )
    ]);
  }
}

import 'package:coverist/widgets/book_info/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:coverist/constants.dart';

import 'package:coverist/widgets/book_info/stepguide_text_widget.dart';

import '/models/file_data_model.dart';

class InfoLogo extends StatefulWidget {
  const InfoLogo({Key? key}) : super(key: key);
  @override
  InfoLogoState createState() => InfoLogoState();
}

class InfoLogoState extends State<InfoLogo> {
  File_Data_Model? file;

  bool isChecked = false;

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
              StepGuideText(mainText: '출판사를 입력해주세요', subText: ''),
              InputText(string: "출판사"),
            ]),
      )
    ]);
  }
}

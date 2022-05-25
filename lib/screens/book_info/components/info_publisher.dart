import 'package:coverist/widgets/book_info/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:coverist/constants.dart';

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
              Text("출판사를 입력해주세요",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              SizedBox(height: 80),
              InputText(string: "출판사"),
            ]),
      )
    ]);
  }
}

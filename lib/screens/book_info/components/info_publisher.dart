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
              Text("출판사를 입력 해주세요",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              Text("입력한 텍스트가 자연스럽게 표지에 포함되요!!!",
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              SizedBox(height: 40),
              InputText(
                string: "출판사",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('입력 안할래욥!', style: TextStyle(color: Colors.black)),
                  Checkbox(
                    fillColor: MaterialStateProperty.all(Colors.white),
                    activeColor: Colors.black,
                    checkColor: Colors.purple,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                        //이때 줄값만 기본값을 준다고 말해주면 될듯
                      });
                    },
                  ),
                ],
              )
            ]),
      )
    ]);
  }
}

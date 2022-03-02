import 'dart:html';

import 'package:flutter/material.dart';

import 'image_view.dart';

import '/widgets/book_info/input_text_widget.dart';
import 'info_tag.dart';

class InfoTitle extends StatefulWidget {
  final event;
  const InfoTitle({Key? key, required this.event}) : super(key: key);

  @override
  _InfoTitleState createState() => _InfoTitleState();
}

class _InfoTitleState extends State<InfoTitle> {
  List inputList = ["제목", "저자명"];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        InputText(
          string: inputList[0],
        ),
        InputText(
          string: inputList[1],
        ),
      ],
    );
  }
}
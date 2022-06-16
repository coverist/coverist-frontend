import 'package:flutter/material.dart';
import 'package:coverist/constants.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_chip_widget.dart';
import 'package:coverist/widgets/book_info/stepguide_text_widget.dart';

class InfoGenre extends StatefulWidget {
  const InfoGenre({Key? key}) : super(key: key);

  @override
  _InfoGenreState createState() => _InfoGenreState();
}

class _InfoGenreState extends State<InfoGenre> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
          height: (MediaQuery.of(context).size.height) * kBookInfoHeight,
          width: (MediaQuery.of(context).size.width) * kBookInfoWidth,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                StepGuideText(
                    mainText: '도서 장르를 선택해주세요',
                    subText: '표지 제작을 원하는 도서의 대분류와 중분류를 선택해주세요'),
                GenreWidget(),
              ]))
    ]);
  }
}

import 'package:flutter/material.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_chip_widget.dart';
import 'package:coverist/widgets/book_info/pagemove_widget.dart';

//함수명은 소문자 class(위젯)는 대문자
// void main() => runApp(const InfoGenrePage()); //최상위함수 한번 호출 파라미터는 반드시 argument

class InfoGenre extends StatefulWidget {
  const InfoGenre({Key? key}) : super(key: key);

  @override
  _InfoGenreState createState() => _InfoGenreState();
}

class _InfoGenreState extends State<InfoGenre> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text('도서 장르와 세부장르를 선택하세요!!',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const Text('각 장르는 1개씩만 선택 가능합니다'),
        const SizedBox(height: 50),
        SizedBox(
          width: 1000,
          child: GenreWidget(),
        )
       
      ],
    );
    // SizedBox(width: 50),
    // movePage(str1: "next", str2: "1");
  }
}

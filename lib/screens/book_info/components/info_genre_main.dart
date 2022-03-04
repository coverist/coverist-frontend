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
<<<<<<< HEAD
    return Column(
      children: <Widget>[
        Text('도서 장르를 선택해주세요!!',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        Text('column은 세로 배치를 의미'),
        SizedBox(height: 30),
        GenreWidget(),
      ],
=======
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('Coverist'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          movePage(str1: "prev", str2: "2"),
          SizedBox(width: 50), //유사 padding 주기
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('도서 장르를 선택해주세요!!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              Text('column은 세로 배치를 의미'),
              SizedBox(height: 30),
              SizedBox(
                width: 500,
                child: GenreWidget(),
              )
            ],
          ),
          SizedBox(width: 50),
          movePage(str1: "next", str2: "1") //유사 padding 주기
        ],
      )),
>>>>>>> 20334db8c7c73c0e632d8105885ddb26c6c7bfdb
    );
    // SizedBox(width: 50),
    // movePage(str1: "next", str2: "1");
  }
}

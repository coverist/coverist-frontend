import 'package:flutter/material.dart'; //이거 없음 아무것도 못함 일종의 가이드라인

import 'info_publisher.dart';
import '../../../widgets/book_info/genre_chip_widget.dart';

//함수명은 소문자 class(위젯)는 대문자
// void main() => runApp(InfoGenrePage()); //최상위함수 한번 호출 파라미터는 반드시 argument

//이하 다 위젯 트리의 위젯들
class InfoGenre extends StatefulWidget {
  final event;
  const InfoGenre({Key? key, required this.event}) : super(key: key);

  @override
  _InfoGenreState createState() => _InfoGenreState();
}

// class InfoGenrePage extends StatelessWidget {
//   //최상위는 레이아웃이라 stateless 위젯tree의 최상위
//   const InfoGenrePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "coverist",
//       theme: ThemeData(primarySwatch: Colors.blueGrey),
//       home: InfoGenre(), //밖에서 커스텀 위젯 선언 home이 있어야 함 첫 화면
//     );
//   }
// }

class _InfoGenreState extends State<InfoGenre> {
  // const _InfoGenreState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          // OutlinedButton(
          // onPressed: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => InfoTitle(event)));
          // },
          // child: Text('prev'),
          // style: OutlinedButton.styleFrom(
          // shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(10.0)))),
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
              GenreWidget(),
            ],
          ),
          SizedBox(width: 50),
          move(str1: "next", str2: "1") //유사 padding 주기
        ],
      )),
    );
  }
}

class move extends StatelessWidget {
  const move({Key? key, required this.str1, required this.str2})
      : super(key: key);

  final String str1;
  final String str2;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          switch (str2) {
            case "1":
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoLogo()));
              break;
            case "2":
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoLogo()));
              break;
          }
        },
        child: Text(str1),
        style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))));
  }
}

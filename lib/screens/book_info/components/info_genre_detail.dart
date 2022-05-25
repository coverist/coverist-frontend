// import 'package:flutter/material.dart';

// import 'package:coverist/widgets/book_info/genre_element/genre_chip_widget.dart';
// import 'package:coverist/widgets/book_info/pagemove_widget.dart';



// //사라질 파일 
// //함수명은 소문자 class(위젯)는 대문자
// void main() =>
//     runApp(const InfoGenrePageDetail()); //최상위함수 한번 호출 파라미터는 반드시 argument

// //이하 다 위젯 트리의 위젯들

// class InfoGenrePageDetail extends StatelessWidget {
//   //최상위는 레이아웃이라 stateless 위젯tree의 최상위
//   const InfoGenrePageDetail({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "coverist",
//       theme: ThemeData(primarySwatch: Colors.blueGrey),
//       home: InfoGenrePageDetailElement(), //밖에서 커스텀 위젯 선언 home이 있어야 함 첫 화면
//     );
//   }
// }

// class InfoGenrePageDetailElement extends StatelessWidget {
//   const InfoGenrePageDetailElement({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey[200],
//       appBar: AppBar(
//         title: Text('Coverist'),
//         centerTitle: true,
//       ),
//       body: Center(
//           child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           movePage(str1: "next", str2: "1"),
//           SizedBox(width: 50), //유사 padding 주기
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('도서 장르를 선택해주세요!!',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.5)),
//               Text('column은 세로 배치를 의미'),
//               SizedBox(height: 30),
//               Dialog(child: GenreWidget()),
//             ],
//           ),
//           SizedBox(width: 50),
//           movePage(str1: "next", str2: "1") //유사 padding 주기
//         ],
//       )),
//     );
//   }
// }

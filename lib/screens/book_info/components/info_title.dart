// Center(
//       child: Container(
//         height: (MediaQuery.of(context).size.height) * 0.7,
//         width: (MediaQuery.of(context).size.width) * 0.8,
//         child:

import 'package:flutter/material.dart';

import '/widgets/book_info/input_text_widget.dart';

class InfoTitle extends StatefulWidget {
  const InfoTitle({Key? key}) : super(key: key);

  @override
  _InfoTitleState createState() => _InfoTitleState();
}

class _InfoTitleState extends State<InfoTitle> {
  List inputList = ["제목", "저자명"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputText(
          string: inputList[0],
        ),
        InputText(
          string: inputList[1],
        )
      ],
    );
  }
}

_getPosition(GlobalKey key) {
  if (key.currentContext != null) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    return position;
  }
}

// import 'package:flutter/material.dart';

// import 'image_view.dart';

// import '/widgets/book_info/input_text_widget.dart';

// // //앱의 시작점
// // void main() {
// //   runApp(InfoTitle()); //반드시 widget을 argument로 가져야 함
// // }

// //우리가 커스텀해야하는 위젯(screen 레이아웃 최초 빌드 역할)
// class InfoTitle extends StatefulWidget {
//   final event;
//   const InfoTitle({Key? key, required this.event}) : super(key: key);

//   @override
//   _InfoTitleState createState() => _InfoTitleState();
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     debugShowCheckedModeBanner: false,
//   //     title: 'INFO_TITLE',
//   //     theme: ThemeData(
//   //       primarySwatch: Colors.blueGrey,
//   //     ),
//   //     home: _InfoTitleState(),
//   //   );
//   // }
// }

// class _InfoTitleState extends State<InfoTitle> {
//   List inputList = ["제목", "저자명"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('INFO_TITLE'),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.blueGrey[200],
//       body: Center(
//         child: Container(
//           height: (MediaQuery.of(context).size.height) * 0.7,
//           width: (MediaQuery.of(context).size.width) * 0.8,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               InputText(
//                 string: inputList[0],
//               ),
//               InputText(
//                 string: inputList[1],
//               ),

// //버튼
//               ButtonBar(
//                 alignment: MainAxisAlignment.center,
//                 children: [
//                   OutlinedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => GridviewPage()));
//                       },
//                       child: Text('Next'),
//                       style: OutlinedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0)))),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// _getPosition(GlobalKey key) {
//   if (key.currentContext != null) {
//     final RenderBox renderBox =
//         key.currentContext!.findRenderObject() as RenderBox;
//     final position = renderBox.localToGlobal(Offset.zero);
//     return position;
//   }
// }

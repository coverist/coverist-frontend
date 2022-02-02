import 'package:flutter/material.dart';
import 'package:coverist/screens/book_info/components/info_genre.dart';
import 'package:coverist/screens/book_info/components/image_view.dart';

import 'input_text.dart';

// //앱의 시작점
// void main() {
//   runApp(InfoTitle()); //반드시 widget을 argument로 가져야 함
// }

//우리가 커스텀해야하는 위젯(screen 레이아웃 최초 빌드 역할)
class InfoTitle extends StatefulWidget {
  final info;
  const InfoTitle({Key? key, required this.info}) : super(key: key);

  @override
  _InfoTitleState createState() => _InfoTitleState();
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'INFO_TITLE',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blueGrey,
  //     ),
  //     home: _InfoTitleState(),
  //   );
  // }
}

class _InfoTitleState extends State<InfoTitle> {
  List inputList = ["제목", "저자명"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFO_TITLE'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: Container(
          height: (MediaQuery.of(context).size.height) * 0.7,
          width: (MediaQuery.of(context).size.width) * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InputText(
                string: inputList[0],
              ),
              InputText(
                string: inputList[1],
              ),

//버튼
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GridviewPage()));
                      },
                      child: Text('Next'),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)))),
                ],
              )
            ],
          ),
        ),
      ),
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

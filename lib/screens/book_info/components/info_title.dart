import 'package:flutter/material.dart';
import 'package:coverist/screens/book_info/components/info_genre_main.dart';

//앱의 시작점
void main() {
  runApp(InfoTitle()); //반드시 widget을 argument로 가져야 함
}

//우리가 커스텀해야하는 위젯(screen 레이아웃 최초 빌드 역할)
class InfoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'INFO_TITLE',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    child: Text('제목 입력',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                  ),
                  Container(
                    child: Text('(필수)',
                        style: TextStyle(fontSize: 14, letterSpacing: 1.5)),
                  ),
                ],
              )),
              TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '제목 입력',
              )),
              SizedBox(height: 30),
              Container(
                  child: Row(
                children: <Widget>[
                  Container(
                    child: Text('작가명 입력',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                  ),
                  Container(
                    child: Text('(필수)',
                        style: TextStyle(fontSize: 14, letterSpacing: 1.5)),
                  ),
                ],
              )),
              TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '작가명 입력',
              )),
              SizedBox(height: 30),

//버튼
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoGenrePage()));
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

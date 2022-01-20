import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('제목 입력(필수)',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '제목 입력',
            )),
            SizedBox(height: 30),
            Text('작가명 입력(필수)',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '작가명 입력',
            ))
          ],
        ),
      ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart'; //이거 없음 아무것도 못함 일종의 가이드라인
import 'package:coverist/savepoint.dart';

//함수명은 소문자 class(위젯)는 대문자
void main() => runApp(MyApp()); //최상위함수 한번 호출 파라미터는 반드시 argument

//이하 다 위젯 트리의 위젯들

class MyApp extends StatelessWidget {   //최상위는 레이아웃이라 stateless 위젯tree의 최상위
  const MyApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "coverist",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
        ),
    home: MyHomePage(), //밖에서 커스텀 위젯 선언 home이 있어야 함 첫 화면
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title : Text('Coverist'), 
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('도서 장르를 선택해주세요!!',style: TextStyle(
                                             fontSize: 30,
                                             fontWeight: FontWeight.bold,
                                             letterSpacing: 1.5)),
            Text('column은 세로 배치를 의미'),
            SizedBox(height: 30),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
              OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르1'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              ),
              OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르2'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              ),
              OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르3'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              ), OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르4'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              )
              ],
            ),
             ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
              OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르1'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              ),
              OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르2'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              ),
              OutlinedButton(onPressed: (){
                print('text~~~~~~~');
              },
                child: Text('#장르3'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                )
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}

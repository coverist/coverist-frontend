import 'dart:io';
import 'package:coverist/screens/book_info/book_info_screen.dart';
import 'package:coverist/screens/book_shelf/book_shelf_screen.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/screens/book_info/components/body.dart';
import 'package:coverist/constants.dart';
import 'package:coverist/models/provider.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(ChangeNotifierProvider(create: (_) => BookInfo(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coverist',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch:
                _createMaterialColor(Color.fromARGB(255, 30, 27, 34)),
            backgroundColor: Colors.black,
            fontFamily: 'Nanum'),
        home: MainPage());
  }

  MaterialColor _createMaterialColor(Color color) {
    List<double> strengths = [.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/back_image2.png'),
                // opacity: 0.3,
                // .blurred(blur: 3, blurColor: Colors.white), // 배경 이미지
              ),
            ),
            child: Column(children: <Widget>[
              SizedBox(height: 200),
              // Image(
              //   image: AssetImage('images/logo7.png'),
              //   fit: BoxFit.contain,
              //   height: 100,
              // ),
              SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(text: '내 작품의 새로운 얼굴 \n이젠 '),
                    TextSpan(
                      text: '쉽고 간편하게',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(
                            top: 15, bottom: 15, left: 20, right: 20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      //side: BorderSide(color: Colors.red) // border line color
                    )),
                    backgroundColor: MaterialStateProperty.all(DeepPurple400),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('표지 제작하러 가기',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => book_shelf_screen()));
                  })
            ])));
  }
}

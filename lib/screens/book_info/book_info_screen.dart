import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/screens/book_info/components/body.dart';
import 'package:coverist/constants.dart';
import 'package:coverist/models/provider.dart';

class book_info_screen extends StatefulWidget {
  const book_info_screen({Key? key}) : super(key: key);

  @override
  _BookInfoScreenState createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<book_info_screen> {
  int step = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coverist',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            canvasColor: Color(0xFFbcabd2),
            primaryColor: Color(0xFF9AA3D0),
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: Color.fromARGB(79, 255, 255, 255))),
        home: Scaffold(
            appBar: AppBar(
              title:
                  //  Text(
                  //   "Coverist : 표지 제작 AI 서비스",
                  //   style: TextStyle(color: Color(0xFFbcabd2)),
                  // ),
                  IconButton(
                icon: Image.asset(
                  'images/logo6.png',
                  fit: BoxFit.fill,
                ),
                iconSize: 100,
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => book_info_screen()));
                },
              ),
              centerTitle: true,
              elevation: 0.0,
              // leading:
            ),
            body: SafeArea(
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/cover1.png'),
                      opacity: 0.3
                      // .blurred(blur: 3, blurColor: Colors.white), // 배경 이미지
                      ),
                ),
                child: Body(),
              ))
            ]))));
  }
}

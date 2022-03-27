import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/screens/book_info/components/body.dart';
import 'package:coverist/constants.dart';
import 'package:coverist/models/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (_) => BookInfo(), child: book_info_screen()));
// }

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
        theme: ThemeData(primaryColor: kMainTheme),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Coverist : 표지 제작 AI 서비스"),
              centerTitle: true,
              elevation: 0.0,
              leading: Image.asset(
                'images/logo3.png',
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/cover1.png'),
                    opacity: 0.3
                    // .blurred(blur: 3, blurColor: Colors.white), // 배경 이미지
                    ),
              ),
              child: Body(),
            )));
  }
}

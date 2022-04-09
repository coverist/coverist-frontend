import 'dart:html';

import 'package:coverist/models/provider.dart';
import 'package:coverist/widgets/book_info/finalimg.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

import '../book_info_screen.dart';
import '/models/coverinfo.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({Key? key}) : super(key: key);

  @override
  _GridviewPageState createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          canvasColor: Color(0xFFbcabd2),
          primaryColor: Color(0xFF9AA3D0),
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(primary: Color.fromARGB(79, 255, 255, 255))),
      home: Scaffold(
          backgroundColor: Colors.blueGrey[200],
          appBar: AppBar(
            title: IconButton(
              icon: Image.asset(
                'images/logo6.png',
                fit: BoxFit.fill,
              ),
              iconSize: 100,
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const book_info_screen()));
              },
            ),
            centerTitle: true,
            elevation: 0.0,
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
              child: const FinalImage(),
            ))
          ]))),
    );
  }
}

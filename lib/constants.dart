import 'package:flutter/material.dart';

const kThemeColor = Color(0xFF001924);
const kScaffoldBackgroundColor = Color(0xFFfcfeff);
const kDefaultFontColor = Color(0xFF001924);
const kNextButtonColor = Color(0xFFb0bfc6); //bluegrey 색상코드임
const kMainColor = Color(0xFF1895a3);
const kMainTheme = Color(0xFFbcabd2); //새로운 테마 색상

const DeepPurple100 = Color.fromARGB(255, 191, 163, 238);
const DeepPurple300 = Color(0xff9575cd);
const DeepPurple350 = Color(0xff65499c);
const DeepPurple400 = Color(0xff7e57c2);
const DeepPurple450 = Color(0xff4d2c91);

const kDefaultPadding = 15.0;

const kBookInfoWidth = 0.4;
const kBookInfoHeight = 0.7;

Route slidePageRouting(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.fastOutSlowIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/constants.dart';
import 'package:coverist/screens/book_info/components/body.dart';
import 'package:coverist/constants.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(book_info_screen());
}

class book_info_screen extends StatelessWidget {
  const book_info_screen({Key? key}) : super(key: key);

  @override
  _BookInfoScreenState createState() => _BookInfoScreenState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coverist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _createMaterialColor(kThemeColor),
      ),
      home: _BookInfoScreenState(),
    );
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

class _BookInfoScreenState extends StatelessWidget {
  int step = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COVERIST : BOOK INFO'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[200],
      body: Body(),
      // ),
    );
  }
}














// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '/constants.dart';

// //앱의 시작점
// void main() {
//   FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.presentError(details);
//     if (kReleaseMode) exit(1);
//   };
//   runApp(MyApp(event: 0));
// }

// class MyApp extends StatelessWidget {
//   final event;
//   const MyApp({Key? key, required this.event}) : super(key: key);

//   @override
//   // _MyAppState createState() => _MyAppState();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Coverist',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: _createMaterialColor(kThemeColor),
//       ),
//       // home: _MyAppState(),
//     );
//   }

//   MaterialColor _createMaterialColor(Color color) {
//     List<double> strengths = [.05];
//     Map<int, Color> swatch = {};
//     final int r = color.red, g = color.green, b = color.blue;

//     for (int i = 1; i < 10; i++) {
//       strengths.add(0.1 * i);
//     }
//     strengths.forEach((strength) {
//       final double ds = 0.5 - strength;
//       swatch[(strength * 1000).round()] = Color.fromRGBO(
//         r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//         g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//         b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//         1,
//       );
//     });
//     return MaterialColor(color.value, swatch);
//   }
// }
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '/constants.dart';
// import 'screens/home/home_screen.dart';

// //앱의 시작점
// void main() {
//   FlutterError.onError = (FlutterErrorDetails details) {
//     FlutterError.presentError(details);
//     if (kReleaseMode) exit(1);
//   };
//   runApp(MyApp()); //반드시 widget을 argument로 가져야 함
// }

// //우리가 커스텀해야하는 위젯(screen 레이아웃 최초 빌드 역할)
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Coverist',
//       theme: ThemeData(
//         primarySwatch: _createMaterialColor(kThemeColor),
//       ),
//       home: HomeScreen(),
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

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants.dart';
import 'package:coverist/screens/book_info/components/body.dart';
import 'package:coverist/models/provider.dart';
import 'package:coverist/constants.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BookInfo()),
    ], child: book_info_screen()),
  );
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
          title: Text('COVERIST : BOOK INFO'),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey[200],
        body: Body());
  }
}

//   List inputList = ["제목", "저자명"];
//   int step = 0;
//   book_info_screen({Key? key, required this.step}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         // height: (MediaQuery.of(context).size.height) * 0.7,
//         // width: (MediaQuery.of(context).size.width) * 0.8,
//         children: [
//           Expanded(
//               child: PageTransitionSwitcher(
//                   transitionBuilder: (
//                     Widget child,
//                     Animation<double> animation,
//                     Animation<double> secondaryAnimation,
//                   ) {
//                     return SharedAxisTransition(
//                       child: child,
//                       animation: animation,
//                       secondaryAnimation: secondaryAnimation,
//                       fillColor: kScaffoldBackgroundColor,
//                       transitionType: SharedAxisTransitionType.horizontal,
//                     );
//                   },
//                   child: _getStepComponents(step))),
//           ButtonBar(
//             alignment: MainAxisAlignment.center,
//             children: [
//               OutlinedButton(
//                   onPressed: () {
//                     this.step += 1;
//                     print(step);
//                     Navigator.push(
//                         // context,
//                         // MaterialPageRoute(
//                         //     builder: (context) =>
//                         //         _getStepComponents(step)));
//                         context,
//                         slidePageRouting(_getStepComponents(step)));
//                   },
//                   child: Text('Next'),
//                   style: OutlinedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)))),
//             ],
//           ),
//         ]);
//   }

//   Widget _getStepComponents(int step) {
//     switch (step) {
//       case 0:
//         return InfoTag(event: 0);
//       case 1:
//         return InfoTitle(event: 0);

//       default:
//         return Container(child: Text("유효하지 않음"));
//     }
//   }
// }

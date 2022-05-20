import 'package:coverist/constants.dart';
import 'package:flutter/material.dart';

class Coverist_Appbar extends StatelessWidget {
  final Widget onPressedPage;
  final Widget body_child;

  const Coverist_Appbar(
      {Key? key, required this.onPressedPage, required this.body_child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coverist',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            canvasColor: DeepPurple300,
            primaryColor: DeepPurple400,
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: Color.fromARGB(79, 255, 255, 255))),
        home: Scaffold(
            appBar: AppBar(
              title: IconButton(
                icon: Image.asset(
                  'images/logo6.png',
                  fit: BoxFit.fill,
                ),
                iconSize: 100,
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => onPressedPage));
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
                  color: Colors.black,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/cover1.png'),
                      opacity: 0.7
                      // .blurred(blur: 3, blurColor: Colors.white), // 배경 이미지
                      ),
                ),
                child: body_child,
              ))
            ]))));
  }
}

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
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            canvasColor: DeepPurple400,
            primaryColor: DeepPurple100,
            accentColor: DeepPurple300,
            selectedRowColor: Colors.black,
            colorScheme: //
                Theme.of(context).colorScheme.copyWith(primary: DeepPurple400)),
        home: Scaffold(
            appBar: AppBar(
              title: IconButton(
                icon: Image.asset(
                  'assets/images/mainlogo.png',
                  fit: BoxFit.fill,
                ),
                iconSize: 100,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => onPressedPage));
                },
              ),
              centerTitle: false, // 아이콘 왼쪽 정렬
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
                      image: AssetImage('assets/images/cover1.png'),
                      opacity: 0.3
                      // .blurred(blur: 3, blurColor: Colors.white), // 배경 이미지
                      ),
                ),
                child: body_child,
              ))
            ]))));
  }
}

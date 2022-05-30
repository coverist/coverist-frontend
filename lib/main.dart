import 'dart:io';
import 'package:coverist/screens/book_info/book_info_screen.dart';
import 'package:coverist/screens/book_shelf/book_shelf_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/screens/book_info/components/body.dart';
import 'package:coverist/screens/book_shelf/components/book_shelf.dart';
import 'package:coverist/widgets/github_button_widget.dart';
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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                children: [top(context), middle(context), bottom(context)])));
  }

  Widget top(BuildContext context) {
    return Container(
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
          SizedBox(height: 280),
          Text(
            '내 작품의 새로운 얼굴 \n이젠 쉽고 간편하게',
            style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                height: 1.3),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
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
                        builder: (context) => book_info_screen()));
              }),
          SizedBox(height: 80),
          IconButton(
            icon: Icon(Icons.arrow_downward_rounded),
            iconSize: 60,
            color: Colors.white,
            onPressed: () {},
          ),
        ]));
  }

  Widget middle(BuildContext context) {
    List<Widget> urlList = [
      Image.asset("assets/images/fix_img1.jpg"),
      Image.asset("assets/images/fix_img2.jpg"),
      Image.asset("assets/images/fix_img3.jpg"),
      Image.asset("assets/images/fix_img4.jpg"),
      Image.asset("assets/images/fix_img5.jpg"),
    ];

    return Container(
      height: (MediaQuery.of(context).size.height) * 0.6,
      width: (MediaQuery.of(context).size.width),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 10),
            // SizedBox(
            //     height: 80,
            //     width: 100,
            //     child: Image.asset(
            //       'images/mainlogo.png',
            //       fit: BoxFit.fitWidth,
            //       // height: 90,
            //     )),
            // Divider(),
            SizedBox(height: 50),
            Text(
              'Coverist의 기록들',
              style: TextStyle(
                  fontFamily: 'Nanum',
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: 1.5,
                  height: 1.3),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.3,
                width: (MediaQuery.of(context).size.width) * 0.9,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 0.3,
                  ),
                  items: urlList.map((item) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: item,
                        ),
                      );
                    });
                  }).toList(),
                ))
          ]),
    );
  }

  Widget bottom(BuildContext context) {
    return Container(
        height: (MediaQuery.of(context).size.height) * 0.2,
        width: (MediaQuery.of(context).size.width),
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 60,
                  width: 100,
                  child: Image.asset(
                    'images/mainlogo.png',
                    fit: BoxFit.fitWidth,
                  )),
              // Text('COVERIST',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 30,
              //         fontFamily: 'Nanum',
              //         color: Colors.black,
              //         letterSpacing: 1.5,
              //         height: 1.3)),
              SizedBox(width: 20),
              SocialButton(
                name: 'github',
                onPressed: () {
                  _launchURL('https://github.com/coverist/coverist-front-end');
                },
              ),
              SizedBox(width: 20),
              SocialButton(
                name: 'notion',
                onPressed: () {
                  _launchURL(
                      'https://www.notion.so/yjyoon/Coverist-63a7ef1662604b3a829f1ca926ffbd28');
                },
              ),
            ],
          ),
          RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontFamily: 'Nanum',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 1.5,
                      height: 1.3),
                  children: [
                TextSpan(
                  text: '\nMake the face of your art easier.',
                ),
                // TextSpan(
                //   text: '\n@coverist.co.kr',
                // ),
              ])),
          SizedBox(height: 20),
        ]));
  }

  _launchURL(url) async {
    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}

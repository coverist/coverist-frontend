import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logo_Select',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LogoPage(),
    );
  }
}

class LogoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}
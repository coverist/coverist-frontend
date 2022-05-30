import 'package:coverist/main.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';
// import 'components/step_scroll.dart';
import 'package:coverist/widgets/book_info/coverist_appbar.dart';

class book_info_screen extends StatefulWidget {
  const book_info_screen({Key? key}) : super(key: key);

  @override
  _BookInfoScreenState createState() => _BookInfoScreenState();
}

class _BookInfoScreenState extends State<book_info_screen> {
  @override
  Widget build(BuildContext context) {
    return Coverist_Appbar(onPressedPage: MyApp(), body_child: Body());
  }
}

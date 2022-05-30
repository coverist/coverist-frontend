import 'package:coverist/main.dart';
import 'package:flutter/material.dart';

import 'package:coverist/widgets/book_info/finalimg.dart';
import 'package:coverist/widgets/book_info/coverist_appbar.dart';
import 'package:coverist/screens/book_info/book_info_screen.dart';

class ResultImage extends StatefulWidget {
  const ResultImage({Key? key}) : super(key: key);

  @override
  _ResultImageState createState() => _ResultImageState();
}

class _ResultImageState extends State<ResultImage> {
  @override
  Widget build(BuildContext context) {
    return Coverist_Appbar(onPressedPage: MyApp(), body_child: FinalImage());
  }
}

import 'package:flutter/material.dart';

import 'package:coverist/widgets/book_info/finalimg.dart';
import 'package:coverist/widgets/book_info/coverist_appbar.dart';
import '../book_info_screen.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({Key? key}) : super(key: key);

  @override
  _GridviewPageState createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  @override
  Widget build(BuildContext context) {
    return Coverist_Appbar(
        onPressedPage: book_info_screen(), body_child: FinalImage());
  }
}

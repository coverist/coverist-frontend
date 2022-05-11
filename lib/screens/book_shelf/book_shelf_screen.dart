import 'package:coverist/screens/book_info/book_info_screen.dart';
import 'package:coverist/screens/book_info/components/body.dart';
import 'package:flutter/material.dart';
import '../../widgets/book_info/coverist_appbar.dart';

class book_shelf_screen extends StatefulWidget {
  const book_shelf_screen({Key? key}) : super(key: key);

  @override
  _BookShelfScreenState createState() => _BookShelfScreenState();
}

class _BookShelfScreenState extends State<book_shelf_screen> {
  @override
  Widget build(BuildContext context) {
    return Coverist_Appbar(
        onPressedPage: book_info_screen(), body_child: Body());
  }
}

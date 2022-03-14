// import 'dart:html';

// import 'package:coverist/screens/book_info/components/info_genre_main.dart';
// import 'package:coverist/screens/book_info/components/info_title.dart';
// import 'package:coverist/screens/book_info/components/info_tag.dart';

// import 'package:flutter/cupertino.dart';

// class Outside extends StatefulWidget {
//   final InputType inputType;
//   const Outside({Key? key, required this.inputType}) : super(key: key);

//   @override
//   _OutsideState createState() => _OutsideState(inputType: this.inputType);
// }

// enum InputType { Title, Tag, Genre }

// class _OutsideState extends State<Outside> {
//   InputType inputType;
//   _OutsideState({required this.inputType});

//   @override
//   Widget build(BuildContext context) {
//     return page[inputType]!!;
//   }
// }

// Map<InputType, Widget> page = {
//   InputType.Title: InfoTitle(),
//   InputType.Tag: InfoTag(),
//   InputType.Genre: InfoGenre()
// };

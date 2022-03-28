import 'package:coverist/screens/book_info/components/info_internetImage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/models/provider.dart';

class StepButton extends StatelessWidget {
  final int step;
  final VoidCallback onPressedPrev;
  final VoidCallback onPressedNext;

  const StepButton(
      {Key? key,
      required this.step,
      required this.onPressedPrev,
      required this.onPressedNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      if (step > 0) buildPrevButton(context),
      if (step > 0) SizedBox(width: 420),
      buildNextButton(context),
    ]);
  }

  @override
  Widget buildSizedBox(BuildContext context) {
    return SizedBox(width: 420);
  }

  @override
  Widget buildPrevButton(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressedPrev,
        child: Text('  이전  '),
        style:
            ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return TextStyle(color: Colors.white);
          } else {
            return TextStyle(color: Color(0xFFbcabd2));
          }
        }), foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          } else {
            return Color(0xFFbcabd2);
          }
        }), backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Color(0xFFbcabd2);
          } else {
            return Colors.white;
          }
        })));
  }

  Widget buildNextButton(BuildContext context) {
    return ElevatedButton(
        onPressed: step == 3
            ? () async {
                String nullcheck = context.read<BookInfo>().nullcheck();
                if (nullcheck.compareTo("allpass") != 0) {
                  _showDialog(context, nullcheck);
                } else {
                  print("send clicked");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const GridviewPage())));
                }
              }
            : onPressedNext,
        child: Text('   ' + (step == 3 ? '표지 만들기' : '다음') + '   '),
        style:
            ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
          // disabled : onpressed가 null일때 , pressed : 클릭됐을때
          if (states.contains(MaterialState.pressed)) {
            return TextStyle(color: Color(0xFFbcabd2));
          } else {
            return TextStyle(color: Colors.white);
          }
        }), foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Color(0xFFbcabd2);
          } else {
            return Colors.white;
          }
        }), backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          } else {
            return Color(0xFFbcabd2);
          }
        })));
  }

  void _showDialog(context, text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text + "를 입력해주세요!"),
          actions: <Widget>[
            FlatButton(
              autofocus: true,
              child: const Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

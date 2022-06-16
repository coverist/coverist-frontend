import 'dart:js';

import 'package:coverist/constants.dart';
import 'package:coverist/screens/book_result/result_image.dart';
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
      buildNextButton(context)
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
        child: Padding(
            // padding: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text('이전', style: TextStyle(fontSize: 20))),
        style:
            ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return TextStyle(color: Colors.white);
          } else {
            return TextStyle(color: DeepPurple400);
          }
        }), foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          } else {
            return DeepPurple400;
          }
        }), backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return DeepPurple400;
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
                  null_check_showDialog(context, nullcheck);
                } else {
                  // print("send clicked");
                  inputcheck_showDialog2(context);
                }
              }
            : onPressedNext,
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              (step == 3 ? '표지 만들기' : '다음'),
              style: TextStyle(fontSize: 20),
            )),
        style:
            ButtonStyle(textStyle: MaterialStateProperty.resolveWith((states) {
          // disabled : onpressed가 null일때 , pressed : 클릭됐을때
          if (states.contains(MaterialState.pressed)) {
            return TextStyle(color: DeepPurple400);
          } else {
            return TextStyle(color: Colors.white);
          }
        }), foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return DeepPurple400;
          } else {
            return Colors.white;
          }
        }), backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          } else {
            return DeepPurple400;
            // return Color(0xFFbcabd2);
          }
        })));
  }

  void null_check_showDialog(context, text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text + "해주세요!"),
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

  void inputcheck_showDialog2(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                const Text("입력하신 정보를 확인해주세요!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 30,
                ),
                RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        children: [
                      TextSpan(
                          text: context.read<BookInfo>().title + " ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      TextSpan(text: context.read<BookInfo>().author + "\n"),
                      TextSpan(
                          text: context.read<BookInfo>().genre +
                              "/" +
                              context.read<BookInfo>().subgenre +
                              "\n"),
                      TextSpan(
                        text: context.read<BookInfo>().publisher.toString() +
                            "\n",
                      ),
                    ])),
                Align(
                    // alignment: Alignment.center,
                    child: Wrap(
                        direction: Axis.horizontal, // 정렬 방향
                        // alignment: WrapAlignment.center, // 정렬 방식
                        spacing: 5, // 상하(좌우) 공간
                        runSpacing: 10, // 좌우(상하) 공간
                        children: chipmake(context.read<BookInfo>().tag))),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              autofocus: true,
              color: DeepPurple400,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "정확히 입력했어요!",
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ResultImage())));
              },
            ),
          ],
        );
      },
    );
  }
}

List<Widget> chipmake(chip_context) {
  List<Widget> chips = [];
  for (int i = 0; i < chip_context.length; i++) {
    Chip actionChip = Chip(
      labelPadding: EdgeInsets.all(2.0),
      backgroundColor: DeepPurple100,
      label: Text(
        '#' + chip_context[i],
        style: TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
    chips.add(actionChip);
  }

  return chips;
}

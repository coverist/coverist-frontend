import 'package:flutter/material.dart';

import 'package:coverist/constants.dart';
import 'package:provider/provider.dart';

import 'package:coverist/widgets/book_info/stepguide_text_widget.dart';

import '/models/provider.dart';

class InfoTag extends StatefulWidget {
  const InfoTag({Key? key}) : super(key: key);

  @override
  _InfoTagState createState() => _InfoTagState();
}

class _InfoTagState extends State<InfoTag> {
  final _infoTextEditController = TextEditingController();

  List<String> _tags = [];
  int maxNum = 5;
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
          height: (MediaQuery.of(context).size.height) * kBookInfoHeight,
          width: (MediaQuery.of(context).size.width) * kBookInfoWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              StepGuideText(
                  mainText: '태그를 입력해주세요',
                  subText: '도서를 잘 설명할 수 있는 키워드를 입력하고 엔터를 눌러주세요(최대 5개)'),

              // Column(
              //   children: [
              //     Row(
              //       children: <Widget>[
              //         Container(
              //           child: Text('태그 입력',
              //               style: TextStyle(
              //                   fontSize: 18,
              //                   // fontWeight: FontWeight.bold,
              //                   letterSpacing: 1.5,
              //                   color: Colors.white)),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              tag_inputText(),
              const SizedBox(height: 10),
              Wrap(
                  direction: Axis.horizontal, // 정렬 방향
                  alignment: WrapAlignment.center, // 정렬 방식
                  spacing: 10, // 상하(좌우) 공간
                  runSpacing: 10, // 좌우(상하) 공간
                  children: buildChips()),
            ],
          ))
    ]);
  }

  void tag_showDialog(text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(text),
          actions: <Widget>[
            new FlatButton(
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

  List<Widget> buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _tags.length; i++) {
      InputChip actionChip = InputChip(
        label: Text('#' + _tags[i]),
        elevation: 5,
        backgroundColor: DeepPurple100,
        onDeleted: () {
          _tags.removeAt(i);

          setState(() {
            _tags = _tags;
          });
        },
      );

      chips.add(actionChip);
    }

    return chips;
  }

  Widget tag_inputText() {
    return TextField(
        textInputAction: TextInputAction.go,
        controller: _infoTextEditController,
        maxLength: 20,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: DeepPurple100, width: 2)),
          counterStyle: TextStyle(color: Colors.white),
          hintText: '입력 예) 창업',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          prefixText: "#",
          prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
        onSubmitted: (value) {
          if (_tags.length >= maxNum) {
            tag_showDialog("최대 " + maxNum.toString() + "개까지 입력할 수 있습니다.");
          } else if (_tags.contains(value.trim())) {
            tag_showDialog("이미 존재하는 태그입니다.");
          } else if (_tags.length < maxNum && !_tags.contains(value.trim())) {
            _tags.add(value.trim());
            context.read<BookInfo>().setTag(_tags);
          }

          _infoTextEditController.clear();
          print('tags : $_tags');

          setState(() {
            _tags = _tags;
          });
        });
  }
}

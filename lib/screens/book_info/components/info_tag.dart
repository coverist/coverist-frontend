import 'package:flutter/material.dart';
import '/widgets/book_info/input_text_widget.dart';

class InfoTag extends StatefulWidget {
  final event;
  const InfoTag({Key? key, required this.event}) : super(key: key);

  @override
  _InfoTagState createState() => _InfoTagState();
}

class _InfoTagState extends State<InfoTag> {
  final _infoTextEditController = TextEditingController();
  List inputTagList = [];

  List<String> _values = [];
  List<bool> _selected = [];
  List<Widget> chips = [];

  @override
  void dispose() {
    _infoTextEditController.dispose();
    super.dispose();
  }

  void _showDialog(text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text(text),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
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

    for (int i = 0; i < _values.length; i++) {
      InputChip actionChip = InputChip(
        label: Text(_values[i]),
        elevation: 5,
        shadowColor: Colors.blueGrey,
        onDeleted: () {
          _values.removeAt(i);

          setState(() {
            _values = _values;
          });
        },
      );

      chips.add(actionChip);
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 10),
        InputText(
          string: "태그",
        ),
        // TextField(
        //     textInputAction: TextInputAction.go,
        //     controller: _infoTextEditController,
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(),
        //       labelText: '입력 예) #창업',
        //     ),
        //     onSubmitted: (value) {
        //       if ('${_infoTextEditController.text}'.startsWith("#")) {
        //         _values.add(_infoTextEditController.text);
        //         // _selected.add(true);
        //         _infoTextEditController.clear();
        //         print('values : $_values');
        //         setState(() {
        //           // _infoTextEditController.text = value;
        //           // inputTagList.add(value);
        //           _values = _values;
        //           // _selected = _selected;

        //           print('value : $value');
        //         });
        //       } else {
        //         _showDialog("입력 형식이 올바르지 않습니다.");
        //         // print('#태그 형식이 아님');
        //         //alertDialog 띄워야 함
        //       }
        //     }),
        SizedBox(height: 10),

        // buildChips(),

        // Row(children: <Widget>[
        //   new TagWidget(
        //       string: '${_infoTextEditController.text}'),
        // ]),
        Wrap(
            direction: Axis.horizontal, // 정렬 방향
            alignment: WrapAlignment.center, // 정렬 방식
            spacing: 10, // 상하(좌우) 공간
            runSpacing: 10, // 좌우(상하) 공간
            children: buildChips()),
      ],
      // ),
      // ],
    );
  }
}
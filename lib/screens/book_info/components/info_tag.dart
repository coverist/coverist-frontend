import 'package:flutter/material.dart';
import '/widgets/book_info/input_text_widget.dart';

class InfoTag extends StatefulWidget {
  const InfoTag({Key? key}) : super(key: key);

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
        // InputText(title: "태그", content: "입력 예) 창업"),
        Row(
          children: <Widget>[
            Container(
              child: Text('태그 입력',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
            ),
            Container(
              child: Text('(필수)',
                  style: TextStyle(fontSize: 14, letterSpacing: 1.5)),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextField(
            textInputAction: TextInputAction.go,
            controller: _infoTextEditController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '입력 예) 창업',
            ),
            onSubmitted: (value) {
              if ('${_infoTextEditController.text}'.startsWith("#")) {
                _values.add(_infoTextEditController.text);
                // _selected.add(true);
                _infoTextEditController.clear();
                print('values : $_values');
                setState(() {
                  // _infoTextEditController.text = value;
                  // inputTagList.add(value);
                  _values = _values;
                  // _selected = _selected;

                  print('value : $value');
                });
              } else {
                _showDialog("입력 형식이 올바르지 않습니다.");
                // print('#태그 형식이 아님');
                //alertDialog 띄워야 함
              }
            }),
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





// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp()); //반드시 widget을 argument로 가져야 함
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: InfoTag(),
//       ),
//       theme: ThemeData(primarySwatch: Colors.blueGrey),
//     );
//   }
// }

// class InfoTag extends StatefulWidget {
//   InfoTag({Key? key}) : super(key: key);

//   @override
//   _InfoTagState createState() => _InfoTagState();
// }

// class _InfoTagState extends State<InfoTag> {
//   final _infoTextEditController = TextEditingController();
//   List inputTagList = [];

//   List<String> _values = [];
//   List<bool> _selected = [];
//   List<Widget> chips = [];

//   @override
//   void dispose() {
//     _infoTextEditController.dispose();
//     super.dispose();
//   }

//   void _showDialog(text) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // Future.delayed(Duration(seconds: 3), () {
//         //   Navigator.pop(context);
//         // });
//         // return object of type Dialog
//         return AlertDialog(
//           content: new Text(text),
//           actions: <Widget>[
//             new FlatButton(
//               child: new Text("Close"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   List<Widget> buildChips() {
//     List<Widget> chips = [];

//     for (int i = 0; i < _values.length; i++) {
//       // if (i == 5) {
//       //   _showDialog("최대 5개까지 입력할 수 있습니다."); //입력 개수 제한
//       //   break;
//       // }

//       InputChip actionChip = InputChip(
//         // selected: _selected[i],
//         label: Text(_values[i]),
//         // avatar: FlutterLogo(),
//         elevation: 5,
//         // pressElevation: 5,
//         shadowColor: Colors.blueGrey,
//         // onPressed: () {
//         //   setState(() {
//         //     _selected[i] = !_selected[i];
//         //   });
//         // },
//         onDeleted: () {
//           _values.removeAt(i);
//           // _selected.removeAt(i);

//           setState(() {
//             _values = _values;
//             // _selected = _selected;
//           });
//         },
//       );

//       chips.add(actionChip);
//     }

//     // return ListView(scrollDirection: Axis.horizontal, children: chips);
//     return chips;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('INFO_TAG'),
//           centerTitle: true,
//         ),
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Container(
//               height: (MediaQuery.of(context).size.height) * 0.7,
//               width: (MediaQuery.of(context).size.width) * 0.8,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       Row(
//                         children: <Widget>[
//                           Container(
//                             child: Text('태그 입력',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 1.5)),
//                           ),
//                           Container(
//                             child: Text('(필수)',
//                                 style: TextStyle(
//                                     fontSize: 14, letterSpacing: 1.5)),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       TextField(
//                           textInputAction: TextInputAction.go,
//                           controller: _infoTextEditController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: '입력 예) #창업',
//                           ),
//                           onSubmitted: (value) {
//                             if ('${_infoTextEditController.text}'
//                                 .startsWith("#")) {
//                               _values.add(_infoTextEditController.text);
//                               // _selected.add(true);
//                               _infoTextEditController.clear();
//                               print('values : $_values');
//                               setState(() {
//                                 // _infoTextEditController.text = value;
//                                 // inputTagList.add(value);
//                                 _values = _values;
//                                 // _selected = _selected;

//                                 print('value : $value');
//                               });
//                             } else {
//                               _showDialog("입력 형식이 올바르지 않습니다.");
//                               // print('#태그 형식이 아님');
//                               //alertDialog 띄워야 함
//                             }
//                           }),
//                       SizedBox(height: 10),

//                       // buildChips(),

//                       // Row(children: <Widget>[
//                       //   new TagWidget(
//                       //       string: '${_infoTextEditController.text}'),
//                       // ]),
//                       Wrap(
//                           direction: Axis.horizontal, // 정렬 방향
//                           alignment: WrapAlignment.center, // 정렬 방식
//                           spacing: 10, // 상하(좌우) 공간
//                           runSpacing: 10, // 좌우(상하) 공간
//                           children: buildChips()),
//                     ],
//                   ),
//                 ],
//               )),
//         ));
//   }
// }
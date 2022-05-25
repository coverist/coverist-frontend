import 'package:flutter/material.dart';
import '/models/provider.dart';
import 'package:provider/provider.dart';
import '../../models/provider.dart';
import 'package:coverist/constants.dart';

//import '/widgets/book_info/tag_chip.dart';

class InputText extends StatefulWidget {
  final String string;
  final bool? inputType;
  const InputText({Key? key, required this.string, required this.inputType})
      : super(key: key);

  @override
  _InputTextState createState() =>
      _InputTextState(str: string, inputType: inputType!);
}

class _InputTextState extends State<InputText> {
  String str;
  bool inputType;
  _InputTextState({required this.str, required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Text(str + ' 입력',
                  style: TextStyle(
                      fontSize: 26,
                      // fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white)),
            ),
            Container(
                child: Text((inputType == true ? '(필수)' : '(선택)'),
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        color: Colors.white))),
          ],
        ),
        SizedBox(height: 10),
        TextField(
            textInputAction: TextInputAction.go,
            // controller: infoTextEditController,
            onChanged: (value) {
              if (str.compareTo("제목") == 0)
                context.read<BookInfo>().setTitle(value);
              else if (str.compareTo("저자명") == 0)
                context.read<BookInfo>().setAuthor(value);
            },
            // onTap: () {
            //   setState(() {
            //     InputDecoration(
            //         hintText: ' ', hintStyle: TextStyle(color: Colors.white));
            //   });
            // },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: DeepPurple300, width: 2)),
              hintText: str + '을 입력하세요',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            style:
                TextStyle(color: DeepPurple400, decorationColor: Colors.white)
            // onSubmitted: (value) async {
            //   _infoTextEditController.text = value;
            //   print('value : $value');
            // }
            ),
      ],
    );
  }
}

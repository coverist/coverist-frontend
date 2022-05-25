import 'package:flutter/material.dart';
import '/models/provider.dart';
import 'package:provider/provider.dart';
import '../../models/provider.dart';
import 'package:coverist/constants.dart';

//import '/widgets/book_info/tag_chip.dart';

class InputText extends StatefulWidget {
  final String string;
  const InputText({Key? key, required this.string}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState(str: string);
}

class _InputTextState extends State<InputText> {
  String str;
  _InputTextState({required this.str});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Text(str + ' 입력',
                  style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      color: Colors.white)),
            ),
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
            onTap: () {
              setState(() {
                InputDecoration(
                    prefixText: ' ',
                    hintText: ' ',
                    hintStyle: TextStyle(color: Colors.white));
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: DeepPurple300, width: 2)),
              hintText: (str.compareTo("출판사") == 0
                  ? '출판사가 없으면 비워주세요.'
                  : str + '을 입력해주세요.'),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            style: TextStyle(color: Colors.black, decorationColor: Colors.white)
            // onSubmitted: (value) async {
            //   _infoTextEditController.text = value;
            //   print('value : $value');
            // }
            ),
      ],
    );
  }
}

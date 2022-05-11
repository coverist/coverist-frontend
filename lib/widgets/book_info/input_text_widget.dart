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
    if (str != "출판사") {
      return Column(
        children: [
          Row(
            children: <Widget>[
              Container(
                child: Text(str + ' 입력',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5)),
              ),
              Container(
                child: const Text('(필수)',
                    style: TextStyle(fontSize: 14, letterSpacing: 1.5)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            style: const TextStyle(color: Colors.white),
            textInputAction: TextInputAction.go,
            // controller: infoTextEditController,
            onChanged: (value) {
              if (str.compareTo("제목") == 0)
                context.read<BookInfo>().setTitle(value);
              else if (str.compareTo("저자명") == 0)
                context.read<BookInfo>().setAuthor(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: str + '을 입력하세요',
            ),
            // onSubmitted: (value) async {
            //   _infoTextEditController.text = value;
            //   print('value : $value');
            // }
          ),
        ],
      );
    } else {
      // 출판사의 경우 필수가 필요 없기 때문
      return Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            textInputAction: TextInputAction.go,
            onChanged: (value) {
              if (str.compareTo("출판사") == 0)
                context.read<BookInfo>().setPublisher(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: str + '을 입력하세요',
            ),
          ),
        ],
      );
    }
  }
}

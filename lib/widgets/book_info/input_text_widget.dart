import 'package:flutter/material.dart';

//import '/widgets/book_info/tag_chip.dart';

class InputText extends StatelessWidget {
  InputText({Key? key, required this.string}) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
    final _infoTextEditController = TextEditingController();

    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              child: Text(string + ' 입력',
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
            labelText: string + ' 입력',
          ),
          // onSubmitted: (value) async {
          //   _infoTextEditController.text = value;
          //   print('value : $value');
          // }
        ),
        SizedBox(height: 30),
      ],                                                                                                                                                                                                                                                                                               
    );
  }
}

import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({Key? key, required this.string}) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
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
        TextField(
            decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: string + ' 입력',
        )),
        SizedBox(height: 30),
      ],
    );
  }
}

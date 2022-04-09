import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Boxfit Cover"),
          backgroundColor: Color(0XFF0CBBEC),
        ),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://image.yes24.com/goods/89990069/XL"),
                    fit: BoxFit.cover))));
  }
}

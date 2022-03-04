import 'package:flutter/material.dart';

import './info_genre_main.dart';
import '/widgets/book_info/publisher_dropzone/dropzone_widget.dart';
import '/widgets/book_info/publisher_dropzone/dropped_file_widget.dart';
import '/models/file_data_model.dart';

class InfoLogo extends StatelessWidget {
  const InfoLogo({Key? key}) : super(key: key); //?
  // @over'/models/file_data_model.dart'
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logo_Select',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LogoPage(),
    );
  }
}

class LogoPage extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  LogoPageState createState() => LogoPageState();
}

class LogoPageState extends State<LogoPage> {
  File_Data_Model? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("logo select page"),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InfoGenre()));
                },
                child: Text('prev'),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)))),
            SizedBox(width: 50), //유사 padding 주기
            SingleChildScrollView(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        width: 220,
                        //height: 150, 이거 주면 짤림
                        child: DroppedFileWidget(file: file),
                      ),
                      //DroppedFileWidget(file:file ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width) * 0.6, //
                        height: 150,
                        child: DropZoneWidget(
                          onDroppedFile: (file) =>
                              setState(() => this.file = file),
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(width: 50), //유사 padding 주기
            OutlinedButton(
                onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => InfoTitle()));
                },
                child: Text('next'),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)))),
          ],
        )));
  }
}

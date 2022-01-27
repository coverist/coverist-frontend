import 'package:coverist/screens/book_info/components/publishe/DropZoneWidget.dart';
import 'package:coverist/screens/book_info/components/publishe/DroppedFileWidget.dart';
import 'package:coverist/screens/book_info/model/file_DataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'package:coverist/screens/book_info/components/info_genre.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InfoLogo()); //반드시 widget을 argument로 가져야 함
}

class InfoLogo extends StatelessWidget {
  @override
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

class LogoPage extends StatefulWidget{
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
      body:Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InfoGenrePage()));
              },
            child: Text('prev'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            )
           ),
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
                        child:DroppedFileWidget(file:file ),
                      ),
                      //DroppedFileWidget(file:file ),
                      SizedBox(height: 20,),
                      Container(
                        width: (MediaQuery.of(context).size.width) * 0.6, // 
                        height: 150,
                        child: DropZoneWidget(
                          onDroppedFile: (file) => setState(()=> this.file = file),
                        ),
                      ),
                    ],
                  )
                ),
            ), 
          SizedBox(width: 50), //유사 padding 주기
          OutlinedButton(onPressed: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => InfoTitle()));
              },
            child: Text('next'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              )
            )
           ),],)
      ) 
    );
  }
}




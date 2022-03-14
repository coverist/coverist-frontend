import 'package:flutter/material.dart';

import 'package:coverist/constants.dart';
import '/widgets/book_info/publisher_dropzone/dropzone_widget.dart';
import '/widgets/book_info/publisher_dropzone/dropped_file_widget.dart';
import '/models/file_data_model.dart';

class InfoLogo extends StatefulWidget {
  const InfoLogo({Key? key}) : super(key: key);

  @override
  InfoLogoState createState() => InfoLogoState();
}

class InfoLogoState extends State<InfoLogo> {
  File_Data_Model? file;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
          height: (MediaQuery.of(context).size.height) * kBookInfoHeight,
          width: (MediaQuery.of(context).size.width) * kBookInfoWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 50), //유사 padding 주기
              Column(
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
                      onDroppedFile: (file) => setState(() => this.file = file),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50), //유사 padding 주기
            ],
          ))
    ]);
  }
}

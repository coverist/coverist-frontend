import 'dart:js';
import 'package:flutter/material.dart';

import '../../../models/file_data_model.dart';

class DroppedFileWidget extends StatelessWidget {
  final File_Data_Model? file;
  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: buildImage(context)),
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    if (file == null) return buildEmptyFile('선택된 이미지 없음');

    print(file!.url);

    return Column(
      children: [
        if (file != null) buildFileDetail(file),
        Image.network(
          file!.url,
          //width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          width: 150,
          height: 150,
          // 불러온 이미지 크기
          fit: BoxFit.cover,
          errorBuilder: (context, error, _) => buildEmptyFile('No Preview'),
        ),
      ],
    );
  }

  Widget buildEmptyFile(String text) {
    return Container(
      width: 100, //120,
      height: 100, //,
      color: Colors.blueGrey.shade300,
      child: Center(child: Text(text)),
    );
  }

  Widget buildFileDetail(File_Data_Model? file) {
    final style = TextStyle();
    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '파일이름: ${file?.name}',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('Type: ${file?.mime}', style: style),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

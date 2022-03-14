import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../../../models/file_data_model.dart';
import '/models/provider.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<File_Data_Model> onDroppedFile;
  const DropZoneWidget({Key? key, required this.onDroppedFile})
      : super(key: key);
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
        child: Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onDrop: (context) => UploadedFile('', context),
          onHover: () => setState(() => highlight = true),
          onLeave: () => setState(() => highlight = false),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () async {
                  final events = await controller.pickFiles();
                  if (events.isEmpty) return;
                  UploadedFile(events.first, context);
                },
                child: Text("드래그하거나 클릭해서 업로드"),
              )
              // ElevatedButton.icon(
              //   onPressed: () async {
              //     final events = await controller.pickFiles();
              //     if (events.isEmpty) return;
              //     UploadedFile(events.first);
              //   },
              //   icon: Icon(Icons.search),
              //   label: Text(
              //     '이미지 찾아보기',
              //     style: TextStyle(color: Colors.white), // fontSize: 15),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //       padding: EdgeInsets.symmetric(horizontal: 20),
              //       primary:
              //           highlight ? Colors.blueGrey[50] : Colors.blueGrey[100],
              //       shape: RoundedRectangleBorder()),
              // )
            ],
          ),
        ),
      ],
    ));
  }

  Future UploadedFile(dynamic event, BuildContext context) async {
    final name = event.name;

    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final data = await controller.getFileData(event);
    final url = await controller.createFileUrl(event);

    print('Name : $name');
    print('Mime: $mime');

    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    print('Mime: $mime');
    // print('Data: $data');

    context.read<BookInfo>().getData(data);

    final droppedFile = File_Data_Model(
        name: name, mime: mime, bytes: byte, url: url, data: data);

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground =
        highlight ? Colors.blueGrey[300] : Colors.blueGrey[400]; //앞은 뭐요
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey,
            strokeWidth: 3,
            dashPattern: [8, 4],
            radius: Radius.circular(10),
            padding: EdgeInsets.zero,
            child: child),
        color: colorBackground,
      ),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '/models/file_data_model.dart';
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
  bool isChecked = false;
  bool highlight = false;
  FilePickerResult? result;
  //PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
        child: Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onDrop: (context) => UploadedFile(context),
          onHover: () => setState(() => highlight = true),
          onLeave: () => setState(() => highlight = false),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_upload_outlined,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () async {
                  final events = await controller.pickFiles();
                  if (events.isEmpty) return;
                  UploadedFile(events.first);
                },
                child: const Text("드래그하거나 클릭해서 업로드",
                    style: TextStyle(color: Colors.white54)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('이미지 없음', style: TextStyle(color: Colors.white)),
                  Checkbox(
                    fillColor: MaterialStateProperty.all(Colors.white),
                    activeColor: Colors.white,
                    checkColor: Colors.red,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Future UploadedFile(dynamic event) async {
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
    //print('Data: $data');

    final droppedFile = File_Data_Model(
        name: name, mime: mime, bytes: byte, url: url, data: data);

    context.read<BookInfo>().setFile(data);

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.black : Colors.black; //앞은 뭐요
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Opacity(
          opacity: 0.8,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey,
                strokeWidth: 3,
                dashPattern: const [8, 4],
                radius: const Radius.circular(10),
                padding: EdgeInsets.zero,
                child: child),
            color: colorBackground,
          ),
        ));
  }
}

import 'dart:io';

import 'dart:typed_data';

class File_Data_Model {
  final String name;
  final String mime;
  final int bytes;
  final String url;
  final Uint8List data;

  File_Data_Model(
      {required this.name,
      required this.mime,
      required this.bytes,
      required this.url,
      required this.data});

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
  }

  Uint8List datatourl(data) {
    return Uint8List.fromList(data);
  }
}

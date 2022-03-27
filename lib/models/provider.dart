import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'coverinfo.dart';

class BookInfo with ChangeNotifier {
  String _title = 'nan';
  String _author = 'nan';

  String _genre = 'nan';
  String _subgenre = 'nan';

  List<String> _tag = [];
  Uint8List? _publisher;

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;

  String get genre => _genre;
  String get subgenre => _subgenre;

  List<String> get tag => _tag;

  Uint8List? get publisher => _publisher;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
    print("provider title : " + title);
  }

  void setAuthor(String author) {
    _author = author;
    notifyListeners();
    print("provider author : " + author);
  }

  void setGenre(String addgenre) {
    _genre = addgenre;
    notifyListeners();
    print(_genre);
  }

  void setSubGenre(String addgenre) {
    _subgenre = addgenre;
    notifyListeners();
    print(_subgenre);
  }

  void setTag(List<String> addTag) {
    _tag = addTag;
    notifyListeners();
    for (int i = 0; i < _tag.length; i++)
      print("provider tag : " + addTag.toString());
  }

  void delTag(String delTag) {
    _tag.remove(delTag);
    notifyListeners();
    print('wait');
  }

  void setFile(Uint8List data) {
    _publisher = data;
    notifyListeners();
    print('file : complete');
  }

  Future<List<Coverinfo>> sendProvider() async {
    var dio = Dio();
    print("provider check1");

    String formdataTag = "";
    for (int i = 0; i < _tag.length; i++) {
      formdataTag += _tag[i];
      if (i < _tag.length - 1) {
        formdataTag += ",";
      }
    }
    var formData = FormData.fromMap({
      'title': _title,
      'author': _author,
      'genre': _genre,
      'sub_genre': _subgenre,
      'tags': formdataTag,
      'publisher':
          MultipartFile.fromBytes(_publisher!, filename: "tempFilename.png")
    });
    // print("info : " + formData.fields.toString());
    var response =
        await dio.post("http://3.37.43.37:8080/api/v1/book", data: formData);

    print(response.toString());
    print(response.data[1]);
    print(response.data.length);

    var coverData = List<Coverinfo>.generate(response.data.length,
        (index) => Coverinfo.fromJson(response.data[index]));

    print(coverData[0]);
    print(coverData[0].url.toString());

    return coverData;
    // print("provider check2");
  }

  String nullcheck() {
    if (_title == 'nan') {
      return "title";
    } else if (_author == 'nan') {
      return "author";
    } else if (_tag == []) {
      return "tag";
    } else if (_genre == 'nan') {
      return "genre";
    } else if (_subgenre == 'nan') {
      return "subgenre";
    } else {
      return "allpass";
    }
  }
}

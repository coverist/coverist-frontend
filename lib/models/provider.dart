import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class BookInfo with ChangeNotifier {
  String _title = 'nan';
  String _author = 'nan';

  String _genre = 'nan';
  String _subgenre = 'nan';

  List<String> _tag = [];
  String _path = 'image.txt';
  File? _publisher;

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;

  String get genre => _genre;
  String get subgenre => _subgenre;

  List<String> get tag => _tag;

  File? get publisher => _publisher;

  String get path => _path;

  void setTitle(String title) {
    _title = title;
    notifyListeners(); //위젯을 변화를 통보한다
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
    print('wait');
  }

  void setSubGenre(String addgenre) {
    _subgenre = addgenre;
    notifyListeners();
    print('wait');
  }

  void setTag(List<String> addTag) {
    //tag 리스트로 만들기
    _tag = addTag;
    notifyListeners();
    // print('wait');
    for (int i = 0; i < _tag.length; i++)
      print("provider tag : " + addTag.toString());
  }

  void setFile(File? a) {
    _publisher = a;
    notifyListeners();
  }

  void delGenre(String delgenre) {
    _genre = 'nan';
    notifyListeners();
    print('wait');
  }

  void delTag(String delTag) {
    _tag.remove(delTag);
    notifyListeners();
    print('wait');
  }

  //값 확인용
  void printItem() {
    print("title : " +
        this._title +
        ", author: " +
        this._author +
        ", tag : " +
        this._tag.toString());
  }

  // void setFile(String url) {
  //   _path = url;
  //   _file = file(_path);
  //   print('file : ' + file.toString());
  // }

  dynamic getData(Uint8List data) {
    _publisher = File.fromRawPath(data);
    print('file : ' + _publisher.toString());
  }
}

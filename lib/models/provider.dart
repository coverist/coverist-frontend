import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BookInfo with ChangeNotifier {
  String _title = 'nan';
  String _author = 'nan';

  String _genre = 'nan';
  String _subgenre = 'nan';

  List<String> _tag = [];
  //String _path = 'image.txt';
  Uint8List? _publisher;

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;

  String get genre => _genre;
  String get subgenre => _subgenre;

  List<String> get tag => _tag;

  Uint8List? get publisher => _publisher;
  //String get path => _path;

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

  //값 확인용
  void printItem() {
    print("title : " +
        this._title +
        ", author: " +
        this._author +
        ", tag : " +
        this._tag.toString());
  }

  Future<void> sendProvider() async {
    var dio = Dio();
    print("provider check1");

    var formData = FormData.fromMap({
      'title': _title,
      'author': _author,
      'genre': _genre,
      'sub_genre': _subgenre,
      'tags': "태그1, 태그2, 태그3"
      // 'publisher':
      //     await MultipartFile.fromBytes(_publisher!, filename: "tempFilename.png")
    });
    print("1" + formData.fields.first.toString());
    var response =
        await dio.post("http://3.37.43.37:8080/api/v1/book", data: formData);
    print("provider check2");
    print("2" + response.toString());

    //Response response1 = dio.get('http://3.37.43.37:8080/api/v1/book');
    //RequestOptions? request;
    //print("2" + request.toString());
  }
}

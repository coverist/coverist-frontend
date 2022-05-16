import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'coverinfo.dart';

class BookInfo with ChangeNotifier {
  List<List<Coverinfo>> allCoverInfo = [];
  List<String> allItemList = [];

  // String _title = 'nan';
  // String _author = 'nan';

  // String _genre = 'nan';
  // String _subgenre = 'nan';

  // String _publisher = ' ';

  // List<String> _tag = [];

// default 고정
  String _title = 'my_title';
  String _author = 'my_author';
  String _genre = '컴퓨터/IT';
  String _subgenre = '모바일프로그래밍';
  String _publisher = ' ';
  List<String> _tag = ['my_tag'];

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;

  String get genre => _genre;
  String get subgenre => _subgenre;

  List<String> get tag => _tag;

  String? get publisher => _publisher;

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

  void setPublisher(String data) {
    _publisher = data;
    notifyListeners();
    print('publisher : complete');
  }

  void setAllList(List<Coverinfo> ci) {
    allCoverInfo.add(ci);
    print('allCoverInfo : ');
    print(allCoverInfo[0][0].url.toString());
    print('\nlen(allCoverInfo) : ');
    print(allCoverInfo.length);
  }

  List<String> getAllItem() {
    allItemList.add(title);
    allItemList.add(author);
    allItemList.add(genre);
    allItemList.add(subgenre);
    allItemList.add(tag.toString());
    print(allItemList);
    return allItemList;
  }

  Future<List<Coverinfo>> sendProvider(String seturl) async {
    var dio = Dio();
    print("provider check1");

    String formdataTag = "";
    for (int i = 0; i < _tag.length; i++) {
      formdataTag += _tag[i];
      if (i < _tag.length - 1) {
        formdataTag += ",";
      }
    }

    var formData;
    print("예상한것처럼 작동");
    formData = FormData.fromMap({
      'title': _title,
      'author': _author,
      'genre': _genre,
      'sub_genre': _subgenre,
      'tags': formdataTag,
      'publisher': _publisher
    });
    String api_path = "http://3.37.43.37:8080/api/v1/" + seturl;
    var response = await dio.post(api_path, data: formData);

    print('response.toString() : ');
    print(response.toString());
    print('\nresponse.data[1]) : ');
    print(response.data[1]);
//    //{cover_id: 0, book_id: 0, title: a, author: b, genre: 컴퓨터/IT, sub_genre: 모바일프로그래밍, tags: [dd], publisher: Coverist, url: https://coverist.s3.ap-northeast-2.amazonaws.com/XL.jpg, created_date: 2022-01-01T00:00:00}
    print('\nresponse.data.length : ');
    print(response.data.length);

    var coverData = List<Coverinfo>.generate(response.data.length,
        (index) => Coverinfo.fromJson(response.data[index]));

    // print('\ncoverData[0] : ');
    // print(coverData[0]); //Instance of 'Coverinfo'
    // print('\ncoverData[0].url.toString() : ');
    // print(coverData[0].url.toString()); //https://coverist.s3.ap-northeast-2.amazonaws.com/XL.jpg

    setAllList(coverData);

    return coverData;
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
    } else if (_tag.isEmpty) {
      return "tag";
    } else {
      return "allpass";
    }
  }
}

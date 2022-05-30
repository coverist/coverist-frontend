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
  String _title = '마지막 벚꽃이 질 때';
  String _author = '김수민';
  String _genre = '시/에세이';
  String _subgenre = '나라별 에세이';
  String _publisher = ' ';
  List<String> _tag = ['벚꽃', '이야기'];

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;

  String get genre => _genre;
  String get subgenre => _subgenre;

  List<String> get tag => _tag;

  String? get publisher => _publisher;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
    // print("provider title : " + title);
  }

  void setAuthor(String author) {
    _author = author;
    notifyListeners();
    // print("provider author : " + author);
  }

  void setGenre(String addgenre) {
    _genre = addgenre;
    notifyListeners();
    // print(_genre);
  }

  void setSubGenre(String addgenre) {
    _subgenre = addgenre;
    notifyListeners();
    // print(_subgenre);
  }

  void setTag(List<String> addTag) {
    _tag = addTag;
    notifyListeners();
    // for (int i = 0; i < _tag.length; i++)
    // print("provider tag : " + addTag.toString());
  }

  void delTag(String delTag) {
    _tag.remove(delTag);
    notifyListeners();
    // print('wait');
  }

  void setPublisher(String data) {
    _publisher = data;
    notifyListeners();
    // print('publisher : complete');
  }

  void setAllList(List<Coverinfo> ci, int num) {
    print("setalllist num : $num");

    // if (seturl.compareTo('') == 0)
    if (num == -1) {
      print("allcoverinfo add전");

      allCoverInfo.add(ci);
      print("allcoverinfo add됨");
    } else if (allCoverInfo[num][0].bookid == ci[num].bookid) {
      print("setalllist num : $num");
      print(
          "allCoverInfo[0][0].bookid : ${allCoverInfo[0][0].bookid.toString()}");
      print(
          "allCoverInfo[num][0].bookid : ${allCoverInfo[num][0].bookid.toString()}");

      print(ci[num].url);
      allCoverInfo[num][0].url = ci[num].url;
    } else {
      print("ci[num].bookid : ${ci[num].bookid}");
    }

    // print('allCoverInfo : $allCoverInfo[0][0].url.toString()');
    print('\nlen(allCoverInfo) : ${allCoverInfo.length}');
  }

  List<String> getAllItem() {
    allItemList.add(title);
    allItemList.add(author);
    allItemList.add(genre);
    allItemList.add(subgenre);
    allItemList.add(tag.toString());
    // print(allItemList);
    return allItemList;
  }

  List<List<Coverinfo>> getAllInfo() {
    return allCoverInfo;
  }

  Future<List<Coverinfo>> sendProvider(String seturl, int num) async {
    print("seturl : $seturl");
    var dio = Dio();

    String formdataTag = "";
    for (int i = 0; i < _tag.length; i++) {
      formdataTag += _tag[i];
      if (i < _tag.length - 1) {
        formdataTag += ",";
      }
    }

    var formData;
    formData = FormData.fromMap({
      'title': _title,
      'author': _author,
      'genre': _genre,
      'sub_genre': _subgenre,
      'tags': formdataTag,
      'publisher': _publisher
    });
    String api_path = "http://3.37.43.37:8080/api/v1/book" + seturl;
    var response = await dio.post(api_path, data: formData);

    // print('response.toString() : $response.toString()');
    // print('\nresponse.data[1]) : $response.data[1]');
//    //{cover_id: 0, book_id: 0, title: a, author: b, genre: 컴퓨터/IT, sub_genre: 모바일프로그래밍, tags: [dd], publisher: Coverist, url: https://coverist.s3.ap-northeast-2.amazonaws.com/XL.jpg, created_date: 2022-01-01T00:00:00}
    // print('\nresponse.data.length : $response.data.length');

    var coverData = List<Coverinfo>.generate(response.data.length,
        (index) => Coverinfo.fromJson(response.data[index]));

    print("coverData : $coverData");
    // print('\ncoverData[0] : ');
    // print(coverData[0]); //Instance of 'Coverinfo'
    // print('\ncoverData[0].url.toString() : ');
    // print(coverData[0].url.toString()); //https://coverist.s3.ap-northeast-2.amazonaws.com/XL.jpg

    setAllList(coverData, num);

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

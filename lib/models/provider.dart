import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'coverinfo.dart';

class BookInfo with ChangeNotifier {
  List<List<Coverinfo>> allCoverInfo = [];
  List<String> allItemList = [];

  List<Coverinfo> coverinfoList = [];

  String _title = 'nan';
  String _author = 'nan';

  String _genre = 'nan';
  String _subgenre = 'nan';

  String _publisher = ' ';

  List<String> _tag = [];

// default 고정
  // String _title = '마지막 벚꽃이 질 때';
  // String _author = '김수민';
  // String _genre = '시/에세이';
  // String _subgenre = '나라별 에세이';
  // String _publisher = ' ';
  // List<String> _tag = ['벚꽃', '이야기'];

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;

  String get genre => _genre;
  String get subgenre => _subgenre;

  List<String> get tag => _tag;

  String? get publisher => _publisher;

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setAuthor(String author) {
    _author = author;
    notifyListeners();
  }

  void setGenre(String addgenre) {
    _genre = addgenre;
    notifyListeners();
  }

  void setSubGenre(String addgenre) {
    _subgenre = addgenre;
    notifyListeners();
  }

  void setTag(List<String> addTag) {
    _tag = addTag;
    notifyListeners();
  }

  void delTag(String delTag) {
    _tag.remove(delTag);
    notifyListeners();
  }

  void setPublisher(String data) {
    _publisher = data;
    notifyListeners();
  }

  void setAllList(List<Coverinfo> ci, int num) {
    print("setalllist num : $num");

    //해당 입력 정보로 처음 생성 시
    if (num == -1) {
      print("-1 allcoverinfo add전 : ${allCoverInfo.toString()}");
      allCoverInfo.add(ci);
      print("-1 allcoverinfo add됨 : ${allCoverInfo.toString()}");

      //해당 입력 정보로 생성된 표지가 있을 때 bookid 비교해서 추가
    } else if (allCoverInfo[num][0].bookid == ci[num].bookid) {
      print(
          "allCoverInfo[0][0].bookid : ${allCoverInfo[0][0].bookid.toString()}");
      print(
          "allCoverInfo[num][0].bookid : ${allCoverInfo[num][0].bookid.toString()}");
      allCoverInfo[num].addAll(ci);
    }

    print('\n allCoverInfo.length : ${allCoverInfo.length}');
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

  List<Coverinfo> setAllInfo() {
    return coverinfoList;
  }

  List<List<Coverinfo>> getAllInfo() {
    print("getAllInfo의 allCoverInfo.toString() : ${allCoverInfo.toString()}");
    return allCoverInfo;
  }

  Future<List<List<Coverinfo>>> getFutureInfo() async {
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
    // String api_path = "http://3.37.43.37:8080/api/v1/book" + seturl;
    String api_path = "http://43.200.53.170:8080/api/v1/book" + seturl;
    var response = await dio.post(api_path, data: formData);

    var coverData = List<Coverinfo>.generate(response.data.length,
        (index) => Coverinfo.fromJson(response.data[index]));

    setAllList(coverData, num);

    // 입력값 초기화
    _title = 'nan';
    _author = 'nan';
    _genre = 'nan';
    _subgenre = 'nan';
    _publisher = ' ';
    _tag = [];

    return coverData;
  }

  String nullcheck() {
    if (_title == 'nan') {
      return "제목을 입력";
    } else if (_author == 'nan') {
      return "저자명을 입력";
    } else if (_tag == []) {
      return "태그를 입력";
    } else if (_genre == 'nan') {
      return "장르 대분류를 선택";
    } else if (_subgenre == 'nan') {
      return "장르 중분류를 선택";
    } else if (_tag.isEmpty) {
      return "태그를 입력";
    } else {
      return "allpass";
    }
  }
}

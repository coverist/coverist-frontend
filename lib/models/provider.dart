import 'package:flutter/material.dart';
import '/models/provider.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_list.dart';

class bookInfo with ChangeNotifier {
  String _title = 'nan';
  String _author = 'nan';
  List<String> _genre = []; //장르만, 전해주면 되니 string
  List<String> _tag = [];

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;
  List<String> get genre => _genre;
  List<String> get tag => _tag;

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
    _genre.add(addgenre);
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

  void delGenre(String delgenre) {
    _genre.remove(delgenre);
    notifyListeners();
    print('wait');
  }

  void delTag(String delTag) {
    _genre.remove(delTag);
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
}

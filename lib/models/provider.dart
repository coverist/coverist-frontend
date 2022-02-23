import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_list.dart';

class bookInfo with ChangeNotifier{
  String _title = 'nan';
  String _author = 'nan';
  List<String> _gerne = [];
  List<String> _tag = [];

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;
  List<String> get genre => _gerne;
  List<String> get tag => _tag;

  void setTitle(title){
    _title = title;
    notifyListeners(); //위젯을 변화를 통보한다
  }
  void setAuthor(author){
    _author = author;
    notifyListeners(); 
  }
  void setGenre(){
    print('wait');
  }
  void setTag(){
    print('wait');    
  }  
}
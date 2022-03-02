import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_list.dart';

class bookInfo with ChangeNotifier{
  String _title = 'nan';
  String _author = 'nan';
  List<String> _genre = [];  //장르만, 전해주면 되니 string
  List<String> _tag = [];

  String get title => _title; //외부에서 접근이 가능하도록
  String get author => _author;
  List<String> get genre => _genre;
  List<String> get tag => _tag;

  void setTitle(String title){
    _title = title;
    notifyListeners(); //위젯을 변화를 통보한다
  }
  void setAuthor(String author){
    _author = author;
    notifyListeners(); 
  }
  void setGenre(String addgenre){
    _genre.add(addgenre); 
    notifyListeners(); 
    print('wait');
  }
  void setTag(String addTag){
    _genre.add(addTag);
    notifyListeners(); 
    print('wait');    
  }  
  void delGenre(String delgenre){
    _genre.remove(delgenre);    
    notifyListeners();  
    print('wait');
  }
  void delTag(String delTag){
    _genre.remove(delTag);
    notifyListeners();     
    print('wait');    
  } 
}
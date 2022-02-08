import 'package:flutter/material.dart';


class genre {
  String label;
  String moveDetailPage;
  Color color;
  bool isSelected;
  genre(this.label, this.moveDetailPage, this.color, this.isSelected);
}

final List<String> MainGenre =["컴퓨터/IT","소설",	"외국어",	"예술/대중문화",	"자기계발",	"중/고등참고서",	"초등참고서",	"정치/사회",	"건강"	,"만화"	,"청소년"	,"인문" ,"잡지",	"취업/수험서"	,"경제/경영"	,"시/에세이",	"기술/공학",	"여행",	"과학",	"어린이전집"	,"역사/문화"	,"유아(0~7세)","가정/육아","취미/실용/스포츠","한국소개도서","요리","종교","어린이(초등)"];

class MainListCreate {

  List<genre> chipsList = [
    genre(MainGenre[1], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[2], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[3], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[4], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[5], 'InfoGenreRomance', Colors.yellow, false),
    genre(MainGenre[6], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[7], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[8], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[9], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[10], 'InfoGenreRomance', Colors.yellow, false)
  ]; 

  // List<genre> chipList = [];

  // for(String s in MainGenre){
  //   genre item =  genre(s,"InfoGenreRomance", Colors.green, false);
  //   chipList.add(item);
  // }
}

class DetailListCreate{
  List<genre> chipsList = [
    genre("로맨스", "InfoGenreRomance", Colors.green, false),
    genre("액션", "InfoGenreRomance", Colors.blueGrey, false),
    genre("호러", "InfoGenreRomance", Colors.deepOrange, false),
    genre("성인", "InfoGenreRomance", Colors.cyan, false),
    genre("잔혹", 'InfoGenreRomance', Colors.yellow, false)
  ]; 
}
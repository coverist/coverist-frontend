import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class genre {
  String label;
  String moveDetailPage;
  Color color;
  bool isSelected;
  genre(this.label, this.moveDetailPage, this.color, this.isSelected);
}

List<String> MainGenre =["컴퓨터/IT","소설",	"외국어",	"예술/대중문화",	"자기계발",	"중/고등참고서",	"초등참고서",	"정치/사회",	"건강"	,"만화"	,"청소년"	,"인문" ,"잡지",	"취업/수험서"	,"경제/경영"	,"시/에세이",	"기술/공학",	"여행",	"과학",	"어린이전집"	,"역사/문화"	,"유아(0~7세)","가정/육아","취미/실용/스포츠","한국소개도서","요리","종교","어린이(초등)"];

class MainListCreate {

  List<genre> chipsList = [
    genre(MainGenre[0], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[1], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[2], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[3], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[4], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[5], 'InfoGenreRomance', Colors.yellow, false),
    genre(MainGenre[6], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[7], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[8], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[9], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[10], 'InfoGenreRomance', Colors.yellow, false),
    genre(MainGenre[11], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[12], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[13], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[14], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[15], 'InfoGenreRomance', Colors.yellow, false),
    genre(MainGenre[16], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[17], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[18], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[19], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[20], 'InfoGenreRomance', Colors.yellow, false),
    genre(MainGenre[21], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[22], "InfoGenreRomance", Colors.blueGrey, false),
    genre(MainGenre[23], "InfoGenreRomance", Colors.deepOrange, false),
    genre(MainGenre[24], "InfoGenreRomance", Colors.cyan, false),
    genre(MainGenre[25], 'InfoGenreRomance', Colors.yellow, false),
    genre(MainGenre[26], "InfoGenreRomance", Colors.green, false),
    genre(MainGenre[27], "InfoGenreRomance", Colors.blueGrey, false),
  ]; 
}

//이런식으로는 왜 안돌아가지
// class MainListCreate{
//   List<Widget> chipsList(){
//     List<Widget> chipsList = [];
//     for(int i =0;i<MainGenre.length;i++){
//       Widget item = genre(
//         MainGenre[i], 'InfoGenreRomance', Colors.yellow, false) as Widget;
//       chipsList.add(item);
//     }
//     return chipsList;
//   }
// } 

class DetailListCreate{
  List<genre> chipsList = [
    genre("로맨스", "InfoGenreRomance", Colors.green, false),
    genre("액션", "InfoGenreRomance", Colors.blueGrey, false),
    genre("호러", "InfoGenreRomance", Colors.deepOrange, false),
    genre("성인", "InfoGenreRomance", Colors.cyan, false),
    genre("잔혹", 'InfoGenreRomance', Colors.yellow, false)
  ];
  List<genre> chipsFor = [
    genre("로맨스", "InfoGenreRomance", Colors.green, false),
    genre("액션", "InfoGenreRomance", Colors.blueGrey, false),
    genre("호러", "InfoGenreRomance", Colors.deepOrange, false),
    genre("성인", "InfoGenreRomance", Colors.cyan, false),
    genre("잔혹", 'InfoGenreRomance', Colors.yellow, false)
  ]; 
}
import 'package:coverist/screens/book_info/components/info_genre_main.dart';
import 'package:coverist/screens/book_info/components/info_Publishe.dart';
import 'package:coverist/screens/book_info/components/publishe_dropzone/DropZoneWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../info_title.dart';


void main() => GenreWidget();

class GenreWidget extends StatefulWidget{
  @override
  GenreWidgetElement createState() => GenreWidgetElement();
}

class genre{
  String label;
  String moveDetailPage;
  Color color;
  bool isSelected;
  genre(this.label,this.moveDetailPage, this.color, this.isSelected);
}

final List<genre> _chipsList = [
  genre("로멘스","InfoGenreRomance" ,Colors.green, false),
  genre("액션","InfoGenreRomance" ,Colors.blueGrey, false),
  genre("호러", "InfoGenreRomance",Colors.deepOrange, false),
  genre("성인","InfoGenreRomance" ,Colors.cyan, false),
  genre("잔혹", 'InfoGenreRomance',Colors.yellow, false)
]; //일단 final로 만들어봄

class GenreWidgetElement extends State<GenreWidget> {
  /*bool selected = false;
  final List<genre> _chipsList = [
    genre("로멘스","InfoGenreRomance" ,Colors.green, false),
    genre("액션","InfoGenreRomance" ,Colors.blueGrey, false),
    genre("호러", "InfoGenreRomance",Colors.deepOrange, false),
    genre("성인","InfoGenreRomance" ,Colors.cyan, false),
    genre("잔혹", 'InfoGenreRomance',Colors.yellow, false)
  ]; //일단 final로 만들어봄*/
  moveDetailPage(str) { //page 이동을 해준는 부분쓰 여기서 세부로 하나씩 추가쓰
    switch (str) {
      case "InfoGenreRomance" : 
        //(context) => InfoGenreRomance();
        print("1");
        return InfoTitle(); 
        break;
      case "InfoGenreHorror":
        break;
      default:
    }
  return str;
  }
  List<Widget> genreChip(){
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left:10, right: 5),
        child: FilterChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value)
          {
            setState((){
              if (_chipsList[i].isSelected){
                _chipsList[i].isSelected = false;
              } 
              else{
                _chipsList[i].isSelected = true;
              }
              print(_chipsList[i].isSelected);
            });
            print('클릭'); //이슈:이동할것이 페이지어야하고 장르를 따로 위젯으로 뺀게 애매해져서 구조를 다시 생각할 필요가있다
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> moveDetailPage(_chipsList[i].moveDetailPage)),
            );
            //MaterialPageRoute(builder: moveDetailPage(_chipsList[i].moveDetailPage));
            //MaterialPageRoute(builder:(context)=>Info(_chipsList[i].moveDetailPage));
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
  @override
  Widget build(BuildContext context) {
    return Row(children: genreChip());
  }
}
// class GenreWidgetElement extends State<GenreWidget> {
//   bool _selected = false;
//   @override
//   Widget build(BuildContext context) {
//     List<FilterChip> gerneChip = [
//       FilterChip(label: Text('공포'), selected: _selected ,onSelected:(bool _selected){_selected = !_selected;}),
//       FilterChip(label: Text('공포'), selected: _selected ,onSelected:(bool _selected){_selected = !_selected;})
//     ];
//     return Row(children: [
//       FilterChip(label: Text('공포'), selected: _selected ,onSelected:(bool _selected){setState((){_selected = !_selected;});}),
//       FilterChip(label: Text('공포'), selected: _selected ,onSelected:(bool _selected){_selected = !_selected;}),
//       FilterChip(label: Text('공포'), selected: _selected ,onSelected:(bool _selected){_selected = !_selected;})
//       ] 
//     );
//   }
// }
// class GenreWidgetElement extends State<GenreWidget> with TickerProviderStateMixin  {
//   List<String> _genre = ['공포', '액션', '로맨스','공포', '액션', '로맨스'];
//   List<bool> _selected = [false,false,false,false,false,false];
//     Widget _buildChips() {
//       List<Widget> chips = [];//new List();
//       for (int i = 0; i < _genre.length; i++) {
//         FilterChip filterChip = FilterChip(
//           selected: _selected[i],
//           label: Text(_genre[i], style: TextStyle(color: Colors.white)),
//           //avatar: FlutterLogo(),
//           elevation: 10,
//           pressElevation: 5,
//           shadowColor: Colors.teal,
//           backgroundColor: Colors.black54,
//           selectedColor: Colors.blue,
//           onSelected: (bool selected) {
//             setState(() {
//               _selected[i] = selected;
//             });
//           },
//         );
//         chips.add(Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: filterChip
//         ));
//       }
//       return ListView(
//         // This next line does the trick.
//         scrollDirection: Axis.horizontal,
//         children: chips,
//       );
//     }
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Woolha.com Flutter Tutorial'),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 30,
//                   child: _buildChips(),
//                 ),
//               ],
//             )
//         ),
//       );
//     }
//   }
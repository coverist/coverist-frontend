import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


import 'package:flutter/material.dart';

void main() => GenreWidget();

class GenreWidget extends StatefulWidget{
  @override
  GenreWidgetElement createState() => GenreWidgetElement();
}

class genre{
  String label;
  Color color;
  bool isSelected;
  genre(this.label, this.color, this.isSelected);
}

class GenreWidgetElement extends State<GenreWidget> {
  bool selected = false;
  List<genre> _chipsList = [
    genre("로멘스", Colors.green, false),
    genre("액션", Colors.blueGrey, false),
    genre("호러", Colors.deepOrange, false),
    genre("성인", Colors.cyan, false),
    genre("잔혹", Colors.yellow, false)
  ];

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
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
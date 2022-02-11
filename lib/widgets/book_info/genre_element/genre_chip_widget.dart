import 'package:flutter/material.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_popup_widget.dart';
import './genre_list.dart';

import '/screens/book_info/components/info_title.dart';


class GenreWidget extends StatefulWidget {
  @override
  GenreWidgetElement createState() => GenreWidgetElement();
}

// class genre {
//   String label;
//   String moveDetailPage;
//   Color color;
//   bool isSelected;
//   genre(this.label, this.moveDetailPage, this.color, this.isSelected);
// }

// final List<genre> _chipsList = [
//   genre("로멘스", "InfoGenreRomance", Colors.green, false),
//   genre("액션", "InfoGenreRomance", Colors.blueGrey, false),
//   genre("호러", "InfoGenreRomance", Colors.deepOrange, false),
//   genre("성인", "InfoGenreRomance", Colors.cyan, false),
//   genre("잔혹", 'InfoGenreRomance', Colors.yellow, false)
// ]; //일단 final로 만들어봄

class GenreWidgetElement extends State<GenreWidget> with MainListCreate{
  /*bool selected = false;
  final List<genre> _chipsList = [
    genre("로멘스","InfoGenreRomance" ,Colors.green, false),
    genre("액션","InfoGenreRomance" ,Colors.blueGrey, false),
    genre("호러", "InfoGenreRomance",Colors.deepOrange, false),
    genre("성인","InfoGenreRomance" ,Colors.cyan, false),
    genre("잔혹", 'InfoGenreRomance',Colors.yellow, false)
  ]; //일단 final로 만들어봄*/
  moveDetailPage(str) {
    //page 이동을 해준는 부분쓰 여기서 세부로 하나씩 추가쓰
    switch (str) {
      case "InfoGenreRomance":
        print("1");
        //return Dialog(child: GenreWidget());
        return InfoTitle(event: 0);
      case "InfoGenreHorror":
        return ;
      default:
    }
    return str;
  }
  
  List<Widget> genreChip() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: chipsList[i].color,
          selected: chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              if (chipsList[i].isSelected) {
                chipsList[i].isSelected = false;
              } else {
                chipsList[i].isSelected = true;
              }
              print(chipsList[i].isSelected);
            });
            if(chipsList[i].isSelected == true){
              showDialog(
                context: context,
                builder: (BuildContext context){
                return detailGenreDialog();
                }
              ); 
            } 
            /*Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      moveDetailPage(_chipsList[i].moveDetailPage)),
            );*/
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

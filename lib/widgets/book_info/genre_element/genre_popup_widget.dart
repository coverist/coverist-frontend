import 'package:flutter/material.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_chip_widget.dart';
import './genre_list.dart';



class detailGenreDialog extends StatefulWidget{
  @override
  detailGenreDialogElement createState() => detailGenreDialogElement();
}

class detailGenreDialogElement extends State<detailGenreDialog> with DetailListCreate{

  setAlertDialog(){
    AlertDialog(
      title: Text("중분류 선택"),
      content: Container(
              constraints: BoxConstraints(
                  maxHeight: 100.0,
              ),
              // child: SingleChildScrollView(
              //   child: Row(children: genreChip(),)
              // ),
            )
    );  
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
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      content :SingleChildScrollView(
        child: ListBody(
          children: const<Widget>[Text("as"),]),)); 
    //return setAlertDialog();
  }
}
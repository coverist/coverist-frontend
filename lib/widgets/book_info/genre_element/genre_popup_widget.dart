import 'package:flutter/material.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_chip_widget.dart';
import './genre_list.dart';



class detailGenreDialog extends StatefulWidget{
  @override
  detailGenreDialogElement createState() => detailGenreDialogElement();
}

class detailGenreDialogElement extends State<detailGenreDialog> with DetailListCreate{
  
  setAlertDialog(){
    return AlertDialog(
      title: const Text("중분류 선택"),
      content: Container(
        constraints: const BoxConstraints(
          maxHeight: 300.0,
          minHeight: 150.0,
          minWidth:  500.0,
        ),
        child: SingleChildScrollView(
          child: Row(
            children: genreChip(),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,)
        ), 
      ),
      actions: <Widget>[
        OutlinedButton(
          child: Text("선택완료"),
          onPressed: ()=> Navigator.of(context).pop(),
        )
      ],
    );  
  }

  List<Widget> genreChip(){
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
    return setAlertDialog();
    /*return AlertDialog(
      content :SingleChildScrollView(
        child: ListBody(
          children: const<Widget>[Text("as"),]),)); */
  }
}
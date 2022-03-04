import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_popup_widget.dart';
import './genre_list.dart';
import '../../../models/genre.dart';

//import '/screens/book_info/components/info_title.dart';

class GenreWidget extends StatefulWidget {
  @override
  GenreWidgetElement createState() => GenreWidgetElement();
}

class GenreWidgetElement extends State<GenreWidget> with MainListCreate {
  late Future<List<Genre>> genres;

  @override
  void initState() {
    super.initState();
    genres = _fetchGenreData();
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
            if (chipsList[i].isSelected == true) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return detailGenreDialog();
                  });
            }
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  FutureBuilder<List<Genre>> genreChip2() {
    final a = FutureBuilder<List<Genre>>(
        future: genres,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Wrap(
                children: List.generate(snapshot.data!.length,
                    (index) => Chip(label: Text(snapshot.data![index].text))));
          } else if (snapshot.hasError) {
            return Text(snapshot.stackTrace.toString());
          }
          return const CircularProgressIndicator();
        });

    return a;
  } // 될까?

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center, runSpacing: 10, children: genreChip());
  }

  Future<List<Genre>> _fetchGenreData() async {
    var dio = Dio();
    final response = await dio.get("http://3.37.43.37:8080/api/v1/book/genre");
    //final genreData1 = (response.data as List).map((e) => e.toString()).toList();

    final genreData = List<Genre>.generate(
        response.data.length, (index) => Genre.fromJson(response.data[index]));

    return genreData;
  }
}

import 'dart:js';

import 'package:coverist/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'package:coverist/widgets/book_info/genre_element/genre_popup_widget.dart';
import '../../../models/genre.dart';
import '../../../models/provider.dart';

//import '/screens/book_info/components/info_title.dart';

class GenreWidget extends StatefulWidget {
  @override
  GenreWidgetElement createState() => GenreWidgetElement();
}

class GenreWidgetElement extends State<GenreWidget> {
  //with MainListCreate {
  late Future<List<Genre>> genres;
  String genre = "";

  @override
  void initState() {
    super.initState();
    genres = _fetchGenreData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Genre>>(
        future: genres,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 10,
                children: List<Widget>.generate(
                    snapshot.data!.length,
                    (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: ChoiceChip(
                          label: Text(snapshot.data![index].text),
                          backgroundColor: Colors.white,
                          selected: genre == snapshot.data![index].text,
                          selectedColor: DeepPurple100,
                          onSelected: (bool selected) {
                            setState(() {
                              genre = snapshot.data![index].text;
                              context.read<BookInfo>().setGenre(genre);
                              showDialog(
                                  context: context,
                                  builder: (context) => DetailGenreDialog(
                                      id: snapshot.data![index].id));
                              // builder: (BuildContext context) {
                              //   return DetailGenreDialog(
                              //       id: snapshot.data![index].id);
                              // });
                            });
                          },
                          padding: const EdgeInsets.all(10),
                        ))));
          } else if (snapshot.hasError) {
            return Text(snapshot.stackTrace.toString());
          }
          return const CircularProgressIndicator();
        });
  }

  Future<List<Genre>> _fetchGenreData() async {
    var dio = Dio();
    final response =
        await dio.get("http://43.200.53.170:8080/api/v1/book/genre");
    //final genreData1 = (response.data as List).map((e) => e.toString()).toList();

    final genreData = List<Genre>.generate(
        response.data.length, (index) => Genre.fromJson(response.data[index]));

    return genreData;
  }
}

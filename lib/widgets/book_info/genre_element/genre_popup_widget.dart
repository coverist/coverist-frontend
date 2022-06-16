import 'package:coverist/constants.dart';
import 'package:coverist/models/genre.dart';
import 'package:coverist/models/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class DetailGenreDialog extends StatefulWidget {
  const DetailGenreDialog({Key? key, required this.id});

  final int id;

  @override
  DetailGenreDialogElement createState() => DetailGenreDialogElement(id: id);
}

class DetailGenreDialogElement extends State<DetailGenreDialog> {
  DetailGenreDialogElement({required this.id});
  int id;
  String subgenre = "";

  late Future<List<Genre>> subgenres;
  @override
  void initState() {
    super.initState();
    subgenres = _fetchGenreData(id);
  }

  Future<List<Genre>> _fetchGenreData(int id) async {
    var dio = Dio();
    final response = await dio
        .get("http://43.200.53.170:8080/api/v1/book/genre/$id/subgenre");
    //final genreData1 = (response.data as List).map((e) => e.toString()).toList();

    final genreData = List<Genre>.generate(
        response.data.length, (index) => Genre.fromJson(response.data[index]));

    return genreData;
  }

  @override
  Widget build(BuildContext context) {
    //return setAlertDialog();
    return FutureBuilder<List<Genre>>(
        future: subgenres,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AlertDialog(
              title: const Text("중분류 선택"),
              content: Container(
                constraints: const BoxConstraints(
                  maxHeight: 300.0,
                  minHeight: 100.0,
                  minWidth: 200.0,
                  maxWidth: 400.0,
                ),
                child: SingleChildScrollView(
                    child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 10,
                  children: List<Widget>.generate(
                      snapshot.data!.length,
                      (index) => Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ChoiceChip(
                            label: Text(snapshot.data![index].text),
                            backgroundColor: Colors.white,
                            selected: subgenre == snapshot.data![index].text,
                            selectedColor: DeepPurple100,
                            onSelected: (bool value) {
                              setState(() {
                                subgenre = snapshot.data![index].text;
                                context.read<BookInfo>().setSubGenre(subgenre);
                                Navigator.pop(context);
                              });
                            },
                            padding: const EdgeInsets.only(left: 10, right: 10),
                          ))),
                )),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.stackTrace.toString());
          }
          return Center(child: SizedBox(child: CircularProgressIndicator()));
        });
  }
}

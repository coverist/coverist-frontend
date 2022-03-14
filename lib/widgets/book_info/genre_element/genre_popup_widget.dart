import 'package:coverist/models/genre.dart';
import 'package:coverist/models/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import './genre_list.dart';

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
/*
  setAlertDialog() {
    return AlertDialog(
      title: const Text("중분류 선택"),
      content: Container(
        constraints: const BoxConstraints(
          maxHeight: 300.0,
          minHeight: 150.0,
          minWidth: 500.0,
        ),
        child: SingleChildScrollView(
            child: Row(
          children: genreChip(),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        )),
      ),
      actions: <Widget>[
        OutlinedButton(
          child: const Text("선택완료"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
///////////////////////////////////////////
  List<Widget> genreChip() {
    List<Widget> chips = [];
    for (int i = 0; i < chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(chipsList[i].label),
          labelStyle: const TextStyle(color: Colors.white),
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
//////////////////////////////////////////////////////
*/

  late Future<List<Genre>> subgenres;
  @override
  void initState() {
    super.initState();
    subgenres = _fetchGenreData(id);
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
                  maxHeight: 200.0,
                  minHeight: 100.0,
                  minWidth: 200.0,
                  maxWidth: 400.0,
                ),
                child: SingleChildScrollView(
                    child: Wrap(
                  alignment: WrapAlignment.center, runSpacing: 10,
                  children: List<Widget>.generate(
                      snapshot.data!.length,
                      (index) => Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: ChoiceChip(
                            label: Text(snapshot.data![index].text),
                            selected: subgenre == snapshot.data![index].text,
                            selectedColor: Colors.blue,
                            onSelected: (bool value) {
                              setState(() {
                                subgenre = snapshot.data![index].text;
                                context.read<BookInfo>().setSubGenre(subgenre);
                              });
                            },
                            padding: const EdgeInsets.only(left: 10, right: 5),
                          ))),
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                )),
              ),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text("선택완료"),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.stackTrace.toString());
          }
          return const CircularProgressIndicator();
        });
  }

  Future<List<Genre>> _fetchGenreData(int id) async {
    var dio = Dio();
    final response =
        await dio.get("http://3.37.43.37:8080/api/v1/book/genre/$id/subgenre");
    //final genreData1 = (response.data as List).map((e) => e.toString()).toList();

    final genreData = List<Genre>.generate(
        response.data.length, (index) => Genre.fromJson(response.data[index]));

    return genreData;
  }
}


/*
class detailGenreDialogElementChip  extends State<detailGenreDialogElement>{
  late Future<List<String>> subgenres; 
  int a = 0 ;
  @override
  void initState() {
    super.initState();
    subgenres = _fetchGenreData(a);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: subgenres,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Wrap(
                alignment: WrapAlignment.center, runSpacing: 10,
                children: List<Widget>.generate(
                  snapshot.data!.length,
                  (index) => Padding(padding:const EdgeInsets.only(left: 10, right: 5),
                    child: FilterChip(
                      label: Text(snapshot.data![index]), 
                      onSelected: (bool value) {  

                        context.read<BookInfo>().setGenre(snapshot.data![index]);

                      },
                      padding: const EdgeInsets.only(left: 10, right: 5),)
                  )
                ));   
          } else if (snapshot.hasError) {
            return Text(snapshot.stackTrace.toString());
          }
          return const CircularProgressIndicator();
        });
  }

  
 Future<List<String>> _fetchGenreData(int id) async {
    var dio = Dio();
    final response = await dio.get("http://3.37.43.37:8080/api/v1/book/genre/$id/subgenre");
    //final genreData1 = (response.data as List).map((e) => e.toString()).toList();

    final genreData = List<String>.generate(
        response.data.length, (index) => (response.data[index]));

    return genreData;
  }

}
*/
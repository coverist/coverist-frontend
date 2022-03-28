import 'dart:html';

import 'package:coverist/models/provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

import '../../../models/coverinfo.dart';

class GridviewPage extends StatefulWidget {
  const GridviewPage({Key? key}) : super(key: key);

  @override
  _GridviewPageState createState() => _GridviewPageState();
}

class _GridviewPageState extends State<GridviewPage> {
  late Future<List<Coverinfo>> coverinfos;
  final WebImageDownloader _webImageDownloader = WebImageDownloader();
  bool downloading = false;

  @override
  void initState() {
    print("called1");
    super.initState();
    coverinfos = context.read<BookInfo>().sendProvider();
  }

  Future<void> _downloadImage(String url) async {
    final Map<String, String> headers = {
      'authorization': "cover",
    };
    setState(() {
      downloading = true;
    });
    await _webImageDownloader.downloadImageFromWeb(
      url,
    );
    setState(() {
      downloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blueGrey[200],
          appBar: AppBar(
            title: const Text('nextpage'),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: FutureBuilder<List<Coverinfo>>(
            future: coverinfos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        const Expanded(
                            flex: 1, child: Text("원하는 표지를 다운로드 해봐요!")),
                        Expanded(
                          flex: 5,
                          child: GridView.builder(
                              itemCount: 4, //item 개수
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
                                childAspectRatio:
                                    3 / 5, //item 의 가로 3, 세로 5 의 비율
                                mainAxisSpacing: 5, //수평 Padding
                                crossAxisSpacing: 30, //수직 Padding
                              ),
                              padding: const EdgeInsets.all(50),
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                        snapshot.data![index].url), //일단 이런식으로
                                    Container(
                                        margin: const EdgeInsets.all(10),
                                        height: 30,
                                        alignment: Alignment.center,
                                        //color: Colors.blueGrey,
                                        child: MaterialButton(
                                          onPressed: () {
                                            _downloadImage(snapshot
                                                .data![index].url
                                                .toString());
                                          },
                                          child: const Text(
                                            "이미지 다운",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          color: Colors.blue,
                                        ))
                                  ],
                                );
                              }),
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                const Text("도서 정보"),
                                Text("제목 : " + snapshot.data![0].title),
                                Text("저자 : " + snapshot.data![0].author),
                                Text("분류 : " +
                                    snapshot.data![0].genre +
                                    "/" +
                                    snapshot.data![0].subgenre),
                                Text(
                                    "태그 : " + snapshot.data![0].tags.toString())
                              ],
                            ))
                      ],
                    ));
              } else if (snapshot.hasError) {
                print("called");
                return Text(snapshot.stackTrace.toString());
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}

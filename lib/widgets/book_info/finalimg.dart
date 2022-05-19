import 'dart:html';

import 'package:coverist/models/provider.dart';
import 'package:coverist/screens/book_shelf/components/book_shelf.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

import '../../screens/book_shelf/components/book_shelf.dart';

import '/models/coverinfo.dart';

class FinalImage extends StatefulWidget {
  @override
  const FinalImage({Key? key}) : super(key: key);

  @override
  _FinalImageState createState() => _FinalImageState();
}

class _FinalImageState extends State<FinalImage> {
  late Future<List<Coverinfo>> coverinfos;
  final WebImageDownloader _webImageDownloader = WebImageDownloader();
  bool downloading = false;

  @override
  void initState() {
    print("called1");
    super.initState();
    coverinfos = context.read<BookInfo>().sendProvider('book');
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
    return FutureBuilder<List<Coverinfo>>(
      future: coverinfos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: SizedBox(height: 50),
                  ),
                  Container(
                      child: Text("표지가 생성되었어요!",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5))),
                  Container(
                    child: SizedBox(height: 30),
                  ),
                  Center(
                      child: Text(
                          "이제 원하는 표지를 무료로 다운로드 할 수 있습니다.\ncoverist 를 통하여 더욱 다양한 표지를 제작해 봐요!",
                          style: TextStyle(fontSize: 20, letterSpacing: 1.5))),
                  Container(
                    child: SizedBox(height: 10),
                  ),
                  Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 4, //item 개수
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, //1 개의 행에 보여줄 item 개수
                          childAspectRatio: 3 / 5, //item 의 가로 3, 세로 5 의 비율
                          mainAxisSpacing: 5, //수평 Padding
                          crossAxisSpacing: 30, //수직 Padding
                        ),
                        padding: const EdgeInsets.all(50),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
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
                                      _downloadImage(
                                          snapshot.data![index].url.toString());
                                    },
                                    child: const Text(
                                      "이미지 다운",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    color: Colors.purple[300],
                                  ))
                            ],
                          );
                        }),
                  ),
                  // Container(
                  //     child: Column(
                  //   children: [
                  //     const Text("도서 정보"),
                  //     Text("제목 : " + snapshot.data![0].title),
                  //     Text("저자 : " + snapshot.data![0].author),
                  //     Text("분류 : " +
                  //         snapshot.data![0].genre +
                  //         "/" +
                  //         snapshot.data![0].subgenre),
                  //     Text("태그 : " + snapshot.data![0].tags.toString())
                  //   ],
                  // )),
                  Container(
                    child: SizedBox(height: 10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("지금까지 제작한 페이지를 내 책장에서 확인할 수 있습니다.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 15,
                      ),
                      Center(
                        child: MaterialButton(
                            color: Colors.purple,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookShelf()));
                            },
                            child: const Text(
                              '책장 보러가기',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 300,
                  )
                ],
              ));
        } else if (snapshot.hasError) {
          print("called");
          return Text(snapshot.stackTrace.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

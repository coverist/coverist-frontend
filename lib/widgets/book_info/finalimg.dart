import 'dart:html';

import 'package:coverist/models/provider.dart';
import 'package:coverist/screens/book_shelf/book_shelf_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:coverist/constants.dart';

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
    super.initState();
    coverinfos = context.read<BookInfo>().sendProvider('', -1);
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                width: 1000,
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
                          Image.network(snapshot.data![index].url),
                          //일단 이런식으로
                          SizedBox(height: 5),
                          Container(
                              margin: const EdgeInsets.all(0),
                              height: 30,
                              alignment: Alignment.center,
                              child: ElevatedButton(
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
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(250, 30),
                                    // backgroundColor:
                                    //     MaterialStateProperty.all(
                                    //         DeepPurple400),
                                  )))
                        ],
                      );
                    }),
              ),
              Text(
                  "이제 원하는 표지를 무료로 다운로드 할 수 있습니다.\ncoverist 를 통하여 더욱 다양한 표지를 제작해 봐요!",
                  style: TextStyle(
                      fontSize: 20, letterSpacing: 1.5, color: Colors.white)),
              SizedBox(height: 30),
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(
                                top: 14, bottom: 14, left: 18, right: 18)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          //side: BorderSide(color: Colors.red) // border line color
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(DeepPurple400),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('책장 보러가기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => book_shelf_screen()));
                      })),
              Container(
                child: SizedBox(height: 10),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          );
        } else if (snapshot.hasError) {
          // print("called");
          return Text(snapshot.stackTrace.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

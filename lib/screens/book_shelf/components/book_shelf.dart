import 'package:coverist/models/provider.dart';
import 'package:coverist/screens/book_info/book_info_screen.dart';
import 'package:coverist/screens/book_info/components/body.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:provider/src/provider.dart';
import '/models/coverinfo.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key}) : super(key: key);

  @override
  BookShelfList createState() => BookShelfList();
}

class BookShelfList extends State<BookShelf> {
  late Future<List<List<Coverinfo>>> allBook;

  // listUpdate(String callStr) {
  //   allList = context.read<BookInfo>().getAllInfo();

  //   print("allList.length ============ ${allList.length}");

  //   setState(() {
  //     // _fetchNewUrlData(num);
  //     allList.forEach((coverList) {
  //       coverList.forEach((cover) {
  //       });
  //     });
  //   });
  // }

  onPlusButtonClick(int num) {
    // addBookCover(num);
    allBook = _fetchNewUrlData(num);
    // listUpdate("onPlusButtonClick");
  }

  Future<List<List<Coverinfo>>> _fetchNewUrlData(int num) async {
    String bookid;
    // bookid = allList[num][0].bookid.toString();

    // print("fetch 함수에서의 bookid : $bookid");
    context.read<BookInfo>().sendProvider("/", num);
    allBook = context.read<BookInfo>().getFutureInfo();
    return allBook;
  }

  void initState() {
    super.initState();
    allBook = context.read<BookInfo>().getFutureInfo();
    print("allBook : ${allBook.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 100),
            Text('지금까지 만든 표지를 조회해보아요~~',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.white)),
            SizedBox(height: 100),
          ],
        ),
        Container(
          child: FutureBuilder<List<List<Coverinfo>>>(
              future: allBook,
              builder:
                  (context, AsyncSnapshot<List<List<Coverinfo>>> snapshot) {
                print("snapshot.data ${snapshot.data}");
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print("에러 발생");
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                } else if (snapshot.hasData) {
                  //책장에 보여줄 책 전체 리스트(세로)
                  return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          // itemCount: snapshot.data!.length,
                          itemCount: 1,
                          itemBuilder: (context, rowIndex) {
                            final item = snapshot.data!;
                            print("row_index : $rowIndex");
                            print("item.length : ${item.length}");
                            return Wrap(

                                //책 한권에 대한 리스트(가로)
                                children: List<Widget>.generate(
                                    item.length,
                                    (colIndex) => SizedBox(
                                          height: (MediaQuery.of(context)
                                                  .size
                                                  .height) *
                                              0.32,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(children: [
                                                  SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                      child: CarouselSlider(
                                                          options:
                                                              CarouselOptions(
                                                            height: (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height) *
                                                                0.3,
                                                            autoPlay: true,
                                                            viewportFraction:
                                                                0.3,
                                                          ),
                                                          items: item[colIndex]
                                                              .map((imageUrl) {
                                                            return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            1.0),
                                                                child: UrlImageWidget(
                                                                    url: imageUrl
                                                                        .url));
                                                          }).toList())),
                                                ]),
                                                const SizedBox(width: 10),
                                                SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.2,
                                                    child: Column(children: [
                                                      RichText(
                                                          text: TextSpan(
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                          .grey[
                                                                      600]),
                                                              children: [
                                                            TextSpan(
                                                                text: item[colIndex]
                                                                            [0]
                                                                        .title
                                                                        .toString() +
                                                                    " ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .white)),
                                                            TextSpan(
                                                                text: "(" +
                                                                    item[colIndex]
                                                                            [0]
                                                                        .author
                                                                        .toString() +
                                                                    ")" +
                                                                    "\n"),
                                                            TextSpan(
                                                                text: item[colIndex]
                                                                            [0]
                                                                        .genre
                                                                        .toString() +
                                                                    "/" +
                                                                    item[colIndex]
                                                                            [0]
                                                                        .subgenre
                                                                        .toString() +
                                                                    "\n"),
                                                            TextSpan(
                                                                text: item[colIndex]
                                                                        [0]
                                                                    .tags
                                                                    .toString()),
                                                          ])),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      // AddCover(
                                                      //     onPressedFunc:
                                                      //         onPlusButtonClick(index2)),
                                                    ]))
                                              ]),
                                        )));
                          }));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                }
              }),
        )
      ]),
    );
  }
}

class AddCover extends StatelessWidget {
  VoidCallback onPressedFunc;
  AddCover({Key? key, required this.onPressedFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade400,
        width: 3,
      )),
      child: Center(
          child: IconButton(
        onPressed: onPressedFunc,
        icon: const Icon(Icons.add_box_sharp),
        color: Colors.grey.shade400,
        focusColor: Colors.purple[100],
      )),
    );
  }
}

class UrlImageWidget extends StatelessWidget {
  String url;
  UrlImageWidget({Key? key, required this.url}) : super(key: key);
  final WebImageDownloader _webImageDownloader = WebImageDownloader();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.network(url),
      highlightColor: Colors.white.withOpacity(0.5),
      splashColor: Colors.cyanAccent.withOpacity(0.4),
      onTap: () {
        _showdialog(context);
      },
    );
  }

  _showdialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Image.network(url),
        actions: [
          ElevatedButton(
              onPressed: () async {
                await _webImageDownloader.downloadImageFromWeb(
                  url,
                );
                Navigator.of(context).pop();
              },
              child: const Text('이미지 다운로드')),
        ],
      ),
    );
  }
}

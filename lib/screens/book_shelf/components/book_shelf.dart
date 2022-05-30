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
  late Future<List<Coverinfo>> coverinfos;

  late List<Widget> imageList;
  List<List<Widget>> allList = [];

  listUpdate(String callStr) {
    // allList = [];
    print(
        "allCoverInfo.length ============ ${context.read<BookInfo>().allCoverInfo.length}");

    setState(() {
      for (int i = 0; i < context.read<BookInfo>().allCoverInfo.length; i++) {
        print("for문 i : $i");
        imageList = [];
        for (int j = 0;
            j < context.read<BookInfo>().allCoverInfo[i].length;
            j++) {
          imageList.add(Test(
              url: context.read<BookInfo>().allCoverInfo[i][j].url.toString()));

          print('imageList ===================== $imageList');
        }
        // imageList.add(AddCover(onPressedFunc: () {
        //   onPlusButtonClick(i);
        // }));
        if (callStr.compareTo("initState") == 0) {
          allList.add(imageList);
          print("allList 추가");
        }
      }
    });
  }

  addBookCover(int num) {
    String bookid;
    print("num : $num");
    bookid = context.read<BookInfo>().allCoverInfo[num][0].bookid.toString();
    print('finalimg bookid : ' + bookid);
    coverinfos = context.read<BookInfo>().sendProvider("/" + bookid, num);
    // context.read<BookInfo>().sendProvider('book/' + bookid);
  }

  void onPlusButtonClick(int num) {
    addBookCover(num);
    listUpdate("onPlusButtonClick");
  }

  void initState() {
    super.initState();
    listUpdate("initState");
  }

  @override
  Widget build(BuildContext context) {
    // print('=====================allList : ');
    // print(allList.toString());

    return Container(
        width: (MediaQuery.of(context).size.width),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(height: 100),
                Text('지금까지 만든 표지를 조회 해보아요~~',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white)),
                SizedBox(height: 100),
              ],
            ),

//////////// 성공 코드
            for (int i = 0; i < allList.length; i++)
              _buildMiddle(allList[i], context.read<BookInfo>().getAllInfo()[i],
                  context, i, () {
                onPlusButtonClick(i);
              }),
          ],
        ));
  }

  Widget _buildMiddle(List<Widget> imageList, List<Coverinfo> my_text,
      BuildContext context, int num, VoidCallback onClick) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: (MediaQuery.of(context).size.height) * 0.3,
                      autoPlay: true,
                      viewportFraction: 0.3,
                    ),
                    items: imageList.map((image) {
                      return FutureBuilder(
                        builder: (context, snapshot) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(1.0),
                            child: image,
                          );
                        },
                      );
                    }).toList(),
                  )),
              SizedBox(width: 10),
              Column(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: my_text[0].title.toString() + " ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                    TextSpan(
                        text: "(" + my_text[0].author.toString() + ")" + "\n",
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                    TextSpan(
                        text: my_text[0].genre.toString() +
                            "/" +
                            my_text[0].subgenre.toString() +
                            "\n",
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                    TextSpan(
                        text: my_text[0].tags.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ])),
                  SizedBox(
                    height: 15,
                  ),
                  // AddCover(onPressedFunc: onClick),
                ],
              )
            ]),
        SizedBox(height: 20)
      ],
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

class Test extends StatelessWidget {
  String url;
  Test({Key? key, required this.url}) : super(key: key);
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

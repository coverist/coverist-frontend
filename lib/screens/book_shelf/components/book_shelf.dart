import 'package:coverist/models/provider.dart';
import 'package:coverist/screens/book_info/book_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:provider/src/provider.dart';
import '/models/coverinfo.dart';

class BookShelf extends StatefulWidget {
  const BookShelf({Key? key}) : super(key: key);

  @override
  _BookShelfList createState() => _BookShelfList();
}

class _BookShelfList extends State<BookShelf> {
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> imageList = [
//       Test(url: 'https://picsum.photos/250?image=9'),
//       Test(url: 'https://picsum.photos/250?image=9'),
//       Test(url: context.read<BookInfo>().allCoverInfo[0][0].url.toString()),
//       addCover()
//     ];

//     return Center(
//         child: SizedBox(
//             width: 800,
//             child: ListView(
//               children: <Widget>[
//                 _buildTop(),
//                 _buildMiddle(imageList),
//                 _buildBottom(),
//                 _buildMiddle(imageList),
//                 _buildBottom(),
//               ],
//             )));
//   }

//   Widget _buildTop() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 20),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text('지금까지 만든 도서를 조회 해보아요~~',
//                   style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.5)),
//               SizedBox(height: 10),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMiddle(List<Widget> imageList) {
//     return SizedBox(
//         width: 100,
//         child: CarouselSlider(
//           options: CarouselOptions(
//             height: 150.0,
//             autoPlay: true,
//             viewportFraction: 0.3,
//           ),
//           items: imageList.map((image) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(1.0),
//                     child: image,
//                   ),
//                 );
//               },
//             );
//           }).toList(),
//         ));
//   }

//   Widget _buildBottom() {
//     return ListView(
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: const [
//             SizedBox(
//               height: 150,
//             ),
//             Text('도서 정보 : ',
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.5)),
//             SizedBox(height: 10),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class Test extends StatelessWidget {
//   String url;
//   Test({Key? key, required this.url}) : super(key: key);
//   final WebImageDownloader _webImageDownloader = WebImageDownloader();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: ElevatedButton(
//       onPressed: () {
//         _showdialog(context);
//       },
//       child: Image.network(url),
//     ));
//   }

//   Future<dynamic> _showdialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         content: Image.network(url),
//         actions: [
//           ElevatedButton(
//               onPressed: () async {
//                 await _webImageDownloader.downloadImageFromWeb(
//                   url,
//                 );
//                 Navigator.of(context).pop();
//               },
//               child: const Text('이미지 다운로드')),
//         ],
//       ),
//     );
//   }
// }

// class addCover extends StatelessWidget {
//   late Future<List<Coverinfo>> coverinfos;

//   //plus 버튼 만들기

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: Center(
//       child: IconButton(
//         onPressed: () {
//           String text = 'book/' +
//               context.read<BookInfo>().allCoverInfo[0][0].bookid.toString();
//           print('finalimg text : ' + text);
//           context.read<BookInfo>().sendProvider(text);
//         },
//         icon: const Icon(Icons.add_box_sharp),
//       ),
//     ));
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          title: IconButton(
            icon: Image.asset(
              'images/logo6.png',
              fit: BoxFit.fill,
            ),
            iconSize: 100,
            onPressed: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const book_info_screen()));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BookShelfList());
  }
}

class BookShelfList extends StatelessWidget {
  List<Widget> imageList = [];
  List<List<Widget>> allList = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < context.read<BookInfo>().allCoverInfo.length; i++) {
      for (int j = 0;
          j < context.read<BookInfo>().allCoverInfo[0].length;
          j++) {
        imageList.add(Test(
            url: context.read<BookInfo>().allCoverInfo[i][j].url.toString()));
      }
      imageList.add(addCover());

      allList.add(imageList);
    }
    print('=====================allList : ');
    print(allList.toString());

    return Center(
        child: SizedBox(
            width: 800,
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 100),
                    Text('지금까지 만든 도서를 조회 해보아요~~',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                    SizedBox(height: 100),
                  ],
                ),

//////////// 성공 코드
                for (int i = 0; i < allList.length; i++)
                  _buildMiddle(allList[i],
                      context.read<BookInfo>().getAllInfo()[i], context),
              ],
            )));
  }

  Widget addCover() {
    return Center(
        child: IconButton(
            onPressed: () {}, icon: const Icon(Icons.add_box_sharp)));
  }

  Widget _buildMiddle(
      List<Widget> imageList, List<Coverinfo> my_text, BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              // width: 300,
              child: CarouselSlider(
            options: CarouselOptions(
              height: (MediaQuery.of(context).size.height) * 0.3,
              autoPlay: true,
              viewportFraction: 0.5,
            ),
            items: imageList.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    child:
                        // width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        // child:
                        ClipRRect(
                      borderRadius: BorderRadius.circular(1.0),
                      child: image,
                    ),
                  );
                },
              );
            }).toList(),
          )),
          Text(
              '제목 : ' +
                  my_text[0].title.toString() +
                  '\n저자명 : ' +
                  my_text[0].author.toString() +
                  '\n장르 : ' +
                  my_text[0].genre.toString() +
                  '\n세부 장르 : ' +
                  my_text[0].subgenre.toString() +
                  '\n태그 : ' +
                  my_text[0].tags.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5)),
        ]);
  }

  Widget _buildBottom(List<String> my_text) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
                '제목 : ' +
                    my_text[0] +
                    '\n저자명 : ' +
                    my_text[1] +
                    '\n장르 : ' +
                    my_text[2] +
                    '\n세부 장르 : ' +
                    my_text[3] +
                    '\n태그 : ' +
                    my_text[4],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            SizedBox(height: 10),
          ],
        ),
      ],
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
      child: Ink.image(
        image: NetworkImage(url),
      ),
      highlightColor: Colors.white.withOpacity(0.5),
      splashColor: Colors.cyanAccent.withOpacity(0.4),
      onTap: () {
        _showdialog(context);
      },
    );
  }

  Future<dynamic> _showdialog(BuildContext context) {
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

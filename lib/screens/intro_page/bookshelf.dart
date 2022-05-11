import 'package:coverist/screens/book_info/book_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

final imageList = [
  // FlatButton(
  //     onPressed:()=> a(1), child: Image.network('https://picsum.photos/250?image=9')),
  // FlatButton(
  //     onPressed:()=> a(2), child: Image.network('https://picsum.photos/250?image=9')),
  // FlatButton(
  //     onPressed:()=> a(3), child: Image.network('https://picsum.photos/250?image=9')),
  Test(),
  Test(),
  Test(),
  Test()
];

// void a(i) {
//   switch(i){
//     case 1:
//       print("object");

//       break;
//     case 2:
//       print("object");
//       break;
//     case 3:
//       print("object");
//       break;
//   }
//   print("헤헤헤헤");
// }

void main() {
  runApp(TestApplication());
}

class TestApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOOK SHELF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        body: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('지금까지 만든 도서를 조회 해보아요~~',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5)),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiddle() {
    return SizedBox(
        width: 100,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            viewportFraction: 0.2,
          ),
          items: imageList.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: image,
                  ),
                );
              },
            );
          }).toList(),
        ));
  }

  Widget _buildBottom() {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 150,
            ),
            Text('도서 정보 : ',
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
  final WebImageDownloader _webImageDownloader = WebImageDownloader();
  bool downloading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            _showdialog(context);
          },
          child: Image.network('https://picsum.photos/250?image=9')),
    );
  }

  Future<dynamic> _showdialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Image.network('https://picsum.photos/250?image=9'),
        actions: [
          ElevatedButton(
              onPressed: () async {
                await _webImageDownloader.downloadImageFromWeb(
                  "https://picsum.photos/250?image=9",
                );
                Navigator.of(context).pop();
              },
              child: const Text('이미지 다운로드')),
        ],
      ),
    );
  }
}

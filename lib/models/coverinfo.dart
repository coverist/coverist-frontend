class Coverinfo {
  int coverid;
  int bookid;
  String title;
  String author;
  String genre;
  String subgenre;
  List<String> tags;
  String? publisher;
  String url;
  String createddate;

  Coverinfo(
      {required this.coverid,
      required this.bookid,
      required this.title,
      required this.author,
      required this.genre,
      required this.subgenre,
      required this.tags,
      this.publisher,
      required this.url,
      required this.createddate});

  factory Coverinfo.fromJson(Map<String, dynamic> json) {
    var tagsFromJson = json['tags'];
    List<String> tags = tagsFromJson.cast<String>();

    return Coverinfo(
        coverid: json['cover_id'],
        bookid: json['book_id'],
        title: json['title'],
        author: json['author'],
        genre: json['genre'],
        subgenre: json['sub_genre'],
        tags: tags,
        publisher: json['publisher'],
        url: json['url'],
        createddate: json['created_date']);
  }
}

// class Coverinfo {
//   int coverid;
//   int bookid;
//   String title;
//   String author;
//   String genre;
//   List<String> tags;
//   String publisher;
//   String url;
//   String createddate;

//   Coverinfo(this.coverid, this.bookid, this.title, this.author, this.genre,
//       this.tags, this.publisher, this.url, this.createddate);

//   Coverinfo.fromJson(Map<String, dynamic> json)
//       : coverid = json['cover_id'],
//         bookid = json['book_id'],
//         title = json['title'],
//         author = json['author'],
//         genre = json['genre'],
//         tags = json['tags'],
//         publisher = json['publisher'],
//         url = json['url'],
//         createddate = json['created_date'];
// }

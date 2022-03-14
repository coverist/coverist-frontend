class Genre {
  int id;
  String text;

  Genre(this.id, this.text);

  Genre.fromJson(Map<String, dynamic> json)   
      : id = json['id'],
        text = json['text'];
}


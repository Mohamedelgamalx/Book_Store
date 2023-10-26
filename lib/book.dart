class Book {
  int? id;
  late String title;
  late String author;
  late String url;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.url
});

  Book.fromMap(Map<String, dynamic> map) {
    if (map['id'] != null) {
      this.id = map['id'];
    }
    this.title = map['title'];
    this.author = map['author'];
    this.url = map['url'];
  }

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {};
    if (this.id != null) {
      map['id'] = this.id;
    }
    map['title'] = this.title;
    map['author'] = this.author;
    map['url'] = this.url;
    return map;
  }
}
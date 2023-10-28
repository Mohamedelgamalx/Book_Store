import 'package:book_store/book_provider.dart';

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
    if (map[columnId] != null) {
      id = map[columnId];
    }
    title = map[columnTitle];
    author = map[columnAuthor];
    url = map[columnUrl];
  }

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {};
    if (id != null) {
      map[columnTitle] = id;
    }
    map[columnTitle] = title;
    map[columnAuthor] = author;
    map[columnUrl] = url;
    return map;
  }
}
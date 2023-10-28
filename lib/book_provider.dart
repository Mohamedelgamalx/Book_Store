import 'package:book_store/book.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String tableBook = 'book';
const String columnId = 'id';
const String columnTitle = 'name';
const String columnAuthor = 'author';
const String columnUrl = 'url';

class BookProvider {
  late Database db;

  static final BookProvider instance = BookProvider._internal();
  factory BookProvider() {
    return instance;
  }
  BookProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'books.db'), version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableBook ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnAuthor text not null,
  $columnUrl text not null,)
''');
        });
  }

  Future<Book> insertBook(Book book) async {
    book.id = await db.insert(tableBook, book.toMap());
    return book;
  }

  Future<int> deleteBook(int id) async {
    return await db.delete(tableBook, where: '$columnId = ?', whereArgs: [id] );
  }

  Future<List<Book>> getAllBooks() async {
    List<Map<String, dynamic>> bookMaps = await db.query(tableBook);
    if (tableBook.length == 0 ) {
      return [];
    } else {
      List<Book> books = [];
      bookMaps.forEach((element) {
        books.add(Book.fromMap(element));
      });
      return books;
    }
  }

  Future close() async => db.close();


}


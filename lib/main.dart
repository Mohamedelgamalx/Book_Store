import 'package:book_store/book_provider.dart';
import 'package:book_store/home.dart';
import 'package:flutter/material.dart';
import 'book.dart';

List<Book> bookList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BookProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
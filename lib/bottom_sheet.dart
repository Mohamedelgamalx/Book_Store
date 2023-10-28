import 'package:book_store/book_provider.dart';
import 'package:book_store/home.dart';
import 'package:flutter/material.dart';
import 'book.dart';
import 'main.dart';

class BottomSheetCustomWidget extends StatefulWidget {
  TextEditingController titleName = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController coverName = TextEditingController();

  BottomSheetCustomWidget({
    super.key,
    required this.authorName,
    required this.coverName,
    required this.titleName,
  });

  @override
  State<BottomSheetCustomWidget> createState() =>
      _BottomSheetCustomWidgetState();
}

class _BottomSheetCustomWidgetState extends State<BottomSheetCustomWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: widget.titleName,
            decoration: const InputDecoration(
                labelText: 'Book Title',
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            controller: widget.authorName,
            decoration: const InputDecoration(
                labelText: 'Book Author',
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            controller: widget.coverName,
            decoration: const InputDecoration(
                labelText: 'Book Cover URL',
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 400,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  BookProvider.instance.insertBook(Book(
                      title: widget.titleName.text,
                      author: widget.authorName.text,
                      url: widget.coverName.text));

                  Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => const Home()),
                          (Route<dynamic> route) => false
                  );

                  widget.titleName.text = '';
                  widget.authorName.text = '';
                  widget.coverName.text = '';
                },
                child: const Text('ADD',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          )
        ],
      ),
    );
  }
}
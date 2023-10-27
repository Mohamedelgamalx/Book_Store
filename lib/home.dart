import 'package:flutter/material.dart';
import 'book.dart';
import 'bottom_sheet.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController titleName = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController coverName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Available Books',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheetCustomWidget(
                    authorName: authorName,
                    coverName: coverName,
                    titleName: titleName,
                  );
                });
          },
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                Book book = bookList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.network(
                      book.url,
                      width: 50,
                    ),
                    title: Text(
                      book.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Author: ${book.author}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Delete Book',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                content: const Text(
                                  'Are you sure you want to delete this book?',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                        const Color(0xffffffff)),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      bookList.removeAt(index);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor:
                                        const Color(0xffffffff)),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ),
                                ],
                              );
                            });
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete_forever_rounded,
                        color: Colors.black54,
                        size: 40,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    });
  }
}

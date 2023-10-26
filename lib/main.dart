import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController titleName = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController coverName = TextEditingController();


  List<Book> bookList = [Book(id: 1, title: 'Aerospace Engineering', author: 'Mohamed Elgamal', url: 'https://i.pinimg.com/474x/95/21/0b/95210bbe77d9106e70461d32d981316c.jpg'),Book(id: 2, title: 'Free Palestine', author: 'Mohamed Elgamal', url: 'https://i.pinimg.com/474x/25/cc/c0/25ccc05e9f1a930326581b78b964e389.jpg'),];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Available Books',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheetCustomWidget();
                    });
              },
              child: const Icon(Icons.add,
                size: 40,),
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
                    leading: Image.network(book.url,
                      width: 50,),
                    title: Text(book.title,style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    subtitle: Text("Author: ${book.author}",style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: const Text('Delete Book',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            ),
                            ),
                            content: const Text('Are you sure you want to delete this book?',style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey
                            ),
                            ),
                            actions: [
                              ElevatedButton(onPressed: () {
                                Navigator.pop(context);
                              },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xffffffff)
                                ),
                                  child: const Text('Cancel',style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey
                                  ),
                                  ),
                              ),
                              ElevatedButton(onPressed: () {
                                bookList.removeAt(index);
                                setState(() { });
                                Navigator.pop(context);
                              },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xffffffff)
                                ),
                                child: const Text('Yes',style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red
                                ),
                                ),
                              ),
                            ],
                          );
                        });
                        setState(() { });
                      },
                      icon: const Icon(Icons.delete_forever_rounded,
                        color: Colors.black54,
                        size: 40,)
                      ,),
                  ),
                );
              }),
            ),
          );
        }
      ),
    );
  }
}

class BottomSheetCustomWidget extends StatefulWidget {
  const BottomSheetCustomWidget({super.key});

  @override
  State<BottomSheetCustomWidget> createState() => _BottomSheetCustomWidgetState();
}

class _BottomSheetCustomWidgetState extends State<BottomSheetCustomWidget> {

  TextEditingController titleName = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController coverName = TextEditingController();


  List<Book> bookList = [Book(id: 1, title: 'Aerospace Engineering', author: 'Mohamed Elgamal', url: 'https://i.pinimg.com/474x/95/21/0b/95210bbe77d9106e70461d32d981316c.jpg'),Book(id: 2, title: 'Free Palestine', author: 'Mohamed Elgamal', url: 'https://i.pinimg.com/474x/25/cc/c0/25ccc05e9f1a930326581b78b964e389.jpg'),];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: titleName,
            decoration: const InputDecoration(
                labelText: 'Book Title', labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )
            ),
          ),
          TextFormField(
            controller: authorName,
            decoration: const InputDecoration(
                labelText: 'Book Author', labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )
            ),
          ),
          TextFormField(
            controller: coverName,
            decoration: const InputDecoration(
                labelText: 'Book Cover URL', labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold
            )
            ),
          ),
          const SizedBox(height: 30,),
          SizedBox(
            width: 400,
            child: ElevatedButton(onPressed: () {
              setState(() { });
              bookList.add(Book(title: titleName.text, author: authorName.text, url: coverName.text));
              if (kDebugMode) {
                print(bookList);
              }
              Navigator.pop(context);
            },
                child: const Text('ADD',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
                )
            ),
          )
        ],
      ),
    );
  }
}


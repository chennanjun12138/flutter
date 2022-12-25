import 'package:flutter_application_1/model/book.dart';

class booklist {
  List<book> books;
  booklist({
    this.books,
  });
  factory booklist.fromJson(List<dynamic> parsedJson) {
    List<book> photos;

    photos = parsedJson.map((i) => book.fromJson(i)).toList();
    return new booklist(
      books: photos,
    );
  }
}

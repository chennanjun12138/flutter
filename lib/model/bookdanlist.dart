import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/bookdan.dart';
import 'package:flutter_application_1/model/moviedan.dart';

class bookdanlist {
  List<bookdan> bookdans;
  bookdanlist({
    this.bookdans,
  });
  factory bookdanlist.fromJson(List<dynamic> parsedJson) {
    List<bookdan> photos;

    photos = parsedJson.map((i) => bookdan.fromJson(i)).toList();
    return new bookdanlist(
      bookdans: photos,
    );
  }
}

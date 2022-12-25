import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/movie.dart';

class movielist {
  List<movie> movies;
  movielist({
    this.movies,
  });
  factory movielist.fromJson(List<dynamic> parsedJson) {
    List<movie> ms;

    ms = parsedJson.map((i) => movie.fromJson(i)).toList();
    return new movielist(
      movies: ms,
    );
  }
}

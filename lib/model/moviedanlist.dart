import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/moviedan.dart';

class moviedanlist {
  List<moviedan> yingdans;
  moviedanlist({
    this.yingdans,
  });
  factory moviedanlist.fromJson(List<dynamic> parsedJson) {
    List<moviedan> photos;

    photos = parsedJson.map((i) => moviedan.fromJson(i)).toList();
    return new moviedanlist(
      yingdans: photos,
    );
  }
}

import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/jingli.dart';

class jinglilist {
  List<jingli> jilings;
  jinglilist({
    this.jilings,
  });
  factory jinglilist.fromJson(List<dynamic> parsedJson) {
    List<jingli> photos;

    photos = parsedJson.map((i) => jingli.fromJson(i)).toList();
    return new jinglilist(
      jilings: photos,
    );
  }
}

import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/dianzan.dart';
import 'package:flutter_application_1/model/user.dart';

class dianzanlist {
  List<dianzan> dianzans;
  dianzanlist({
    this.dianzans,
  });
  factory dianzanlist.fromJson(List<dynamic> parsedJson) {
    List<dianzan> photos;

    photos = parsedJson.map((i) => dianzan.fromJson(i)).toList();
    return new dianzanlist(
      dianzans: photos,
    );
  }
}

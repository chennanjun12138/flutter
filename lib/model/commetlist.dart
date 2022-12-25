import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/commet.dart';
import 'package:flutter_application_1/model/dianzan.dart';
import 'package:flutter_application_1/model/user.dart';

class commentlist {
  List<comment> comments;
  commentlist({
    this.comments,
  });
  factory commentlist.fromJson(List<dynamic> parsedJson) {
    List<comment> photos;

    photos = parsedJson.map((i) => comment.fromJson(i)).toList();
    return new commentlist(
      comments: photos,
    );
  }
}

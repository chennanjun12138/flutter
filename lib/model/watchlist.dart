import 'package:flutter_application_1/model/watch.dart';
import 'package:flutter_application_1/model/yueduzhuangtai.dart';

class watchlist {
  List<watch> watchs;
  watchlist({
    this.watchs,
  });
  factory watchlist.fromJson(List<dynamic> parsedJson) {
    List<watch> photos;

    photos = parsedJson.map((i) => watch.fromJson(i)).toList();
    return new watchlist(
      watchs: photos,
    );
  }
}

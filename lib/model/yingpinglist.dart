import 'package:flutter_application_1/model/shuping.dart';
import 'package:flutter_application_1/model/yingpingmodel.dart';

class yingpinglist {
  List<yingpingmodel> yingpings;
  yingpinglist({
    this.yingpings,
  });
  factory yingpinglist.fromJson(List<dynamic> parsedJson) {
    List<yingpingmodel> photos;

    photos = parsedJson.map((i) => yingpingmodel.fromJson(i)).toList();
    return new yingpinglist(
      yingpings: photos,
    );
  }
}

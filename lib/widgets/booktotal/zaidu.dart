import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/bookdan.dart';
import 'package:flutter_application_1/model/jingli.dart';
import 'package:http/http.dart'
    as http; // use 'as http' to avoid possible name clashes
import 'booklistItem.dart';
import 'package:flutter_application_1/model/yueduzhuangtai.dart';

class zaidu extends StatelessWidget {
  List<book> books = [];
  List<yuduzhuangtai> reads = [];
  List<bookdan> bookdans = [];
  BuildContext context2;
  List<jingli> jinglis;
  String session_id;
  zaidu(
      {Key key,
      this.reads,
      this.books,
      this.context2,
      this.bookdans,
      this.jinglis,
      this.session_id})
      : super(key: key);

  final _biggerFont = const TextStyle(fontSize: 18.0); // 字体大小
  @override
  Widget build(BuildContext context) {
    // print("zaidu1:${session_id}");
    return _buildSuggestions(); // body为一个ListView
  }

  Widget _buildSuggestions() {
    // print("zaidu2:${session_id}");
    return new Expanded(
      child: new ListView.builder(
        padding: const EdgeInsets.all(16.0), // 设置padding
        itemBuilder: (context, index) {
          return bookListItem(
              reads[index], books, context2, bookdans, jinglis, session_id);
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: reads.length,
      ),
    );
  }
}

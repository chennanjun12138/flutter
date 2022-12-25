import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/bookdan.dart';
import 'package:flutter_application_1/widgets/booktotal/shudanlistItem.dart';
import 'package:http/http.dart'
    as http; // use 'as http' to avoid possible name clashes
import 'booklistItem.dart';
import 'package:flutter_application_1/model/yueduzhuangtai.dart';

class mybooklist extends StatelessWidget {
  List<book> books = [];
  // List<yuduzhuangtai> reads = [];
  BuildContext context2;
  List<bookdan> bd1;
  String session_id;
  String userid;
  mybooklist(
      {Key key,
      this.context2,
      this.bd1,
      this.books,
      this.session_id,
      this.userid})
      : super(key: key);

  final _biggerFont = const TextStyle(fontSize: 18.0); // 字体大小
  @override
  Widget build(BuildContext context) {
    return _buildSuggestions(); // body为一个ListView
  }

  Widget _buildSuggestions() {
    return new Expanded(
      child: new ListView.builder(
        padding: const EdgeInsets.all(16.0), // 设置padding
        itemBuilder: (context, index) {
          return shudanlistItem(
              context2, bd1[index], books, session_id, userid);
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: bd1.length,
      ),
    );
  }
}

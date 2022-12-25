import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/book.dart';
import 'package:english_words/english_words.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/bookdan.dart';
import 'package:flutter_application_1/model/jingli.dart';
import 'package:http/http.dart'
    as http; // use 'as http' to avoid possible name clashes
import 'book_card_compact.dart';
import 'bookgard.dart';
import 'package:flutter_application_1/model/yueduzhuangtai.dart';

class shujia extends StatelessWidget {
  List<book> books = [];
  List<yuduzhuangtai> reads = [];
  List<jingli> jinglis = [];
  String readstaus;
  String session_id;
  List<bookdan> bangdans = [];
  shujia(
      {Key key,
      this.reads,
      this.books,
      this.readstaus,
      this.jinglis,
      this.session_id,
      this.bangdans})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Matrix4 transform = new Matrix4.skewX(10.0);
    transform.translate(-100.0);
    return bookGridView(
      books: books,
      reads: reads,
      readstaus: readstaus,
      jinglis: jinglis,
      session_id: session_id,
      bangdans: bangdans,
    );
  }
}

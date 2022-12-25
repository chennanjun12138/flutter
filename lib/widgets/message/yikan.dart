import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/book.dart';
import 'package:english_words/english_words.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart'
    as http; // use 'as http' to avoid possible name clashes;
import 'package:flutter_application_1/widgets/message/bangdan.dart';
import 'package:flutter_application_1/widgets/message/shijianzhou.dart';
import 'package:flutter_application_1/widgets/message/shujutongji.dart';

String dropdownValue = "时间轴";
int flag = 1;

class yikan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(-0.75, -1),
        child: Column(
          children: <Widget>[
            IntrinsicWidth(
                child: DropdownButton<String>(
              underline: const SizedBox(),
              // decoration:
              //const InputDecoration(border: OutlineInputBorder()),
              value: dropdownValue,
              onChanged: (newValue) {
                dropdownValue = newValue;
                if (newValue == "时间轴") {
                  flag = 1;
                } else if (newValue == "我的榜单") {
                  flag = 2;
                } else if (newValue == "数据统计") {
                  flag = 3;
                }
              },
              items: <String>['时间轴', '我的榜单', '数据统计']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),
            if (flag == 1) shijianzhou(),
            if (flag == 2) bangdan(),
            if (flag == 3) shujujiegou(),
          ],
        ));
  }
}

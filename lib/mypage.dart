import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user_info.dart';
import 'dart:convert';
import 'package:http/http.dart'
    as http; // use 'as http' to avoid possible name clashes
import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/booklist.dart';
//import 'package:json_annotation/json_annotation.dart';

class Mypage extends StatefulWidget {
  @override
  MypageState createState() => new MypageState();
}

String name = "";
String result = "";
String url = "http://638ca501.r2.cpolar.cn";

class MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'BookReviewRemarkList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/rpx.dart';

class BookReview extends StatefulWidget {
  String session_id;
  List bookreview;
  String email;
  String like;
  List likes;
  String remark;
  Map<int, dynamic> map;
  Map<int, dynamic> mapthumb;
  Map<int, dynamic> mapremark;
  Map<int, dynamic> mapremarkcontent;
  Map<int, dynamic> mapremark_remark;
  BookReview(
      this.session_id,
      this.bookreview,
      this.email,
      this.like,
      this.likes,
      this.remark,
      this.map,
      this.mapthumb,
      this.mapremark,
      this.mapremarkcontent,
      this.mapremark_remark);
  @override
  BookReviewState createState() => BookReviewState(
      session_id: session_id,
      bookreview: bookreview,
      email: email,
      like: like,
      likes: likes,
      remark: remark,
      map: map,
      mapthumb: mapthumb,
      mapremark: mapremark,
      mapremarkcontent: mapremarkcontent,
      mapremark_remark: mapremark_remark);
}

class BookReviewState extends State<BookReview> {
  BookReviewState(
      {Key key,
      this.session_id,
      this.bookreview,
      this.email,
      this.like,
      this.likes,
      this.remark,
      this.map,
      this.mapthumb,
      this.mapremark,
      this.mapremarkcontent,
      this.mapremark_remark})
      : super();
  final String session_id;
  final List bookreview;
  final String email;
  final String like;
  final List likes;
  final String remark;
  final Map<int, dynamic> map;
  final Map<int, dynamic> mapthumb;
  final Map<int, dynamic> mapremark;
  final Map<int, dynamic> mapremarkcontent;
  final Map<int, dynamic> mapremark_remark;

  @override
  void initState() {
    super.initState();
    // getNetData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getNetData() {
    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 2), () {
        return "hello";
      }),
    ]).then((results) {
      print(results[0]);
      for (int i = 0; i < bookreview.length; i++) {
        Future(() => getlike(
            bookreview[i]["book_reaction_id"], bookreview[i]["book_id"]));
      }
      for (int i = 0; i < bookreview.length; i++) {
        Future(() => getremark(
            bookreview[i]["book_reaction_id"], bookreview[i]["book_id"]));
      }
      for (int k in mapremarkcontent.keys) {
        //k是bookreview的id
        Future(() =>
            getremark_remark(mapremarkcontent[k]["comment_id"], k.toString()));
      }
    }).catchError((e) {
      print(e);
    });
  }

  //TODO 查询“评论”--评论（GET）
  Future<void> getremark_remark(int j, String dest_id) async {
    final response2 = await http.get(Uri.parse(
        'https://762311c2.r6.cpolar.top/comment_query?type=8&dest_id=$dest_id'));
    if (response2.statusCode == 200) {
      var utf8ResponseBody = utf8.decode(response2.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(utf8ResponseBody);
      if (responseBody.containsKey("size")) {
        setState(() {
          mapremark_remark[j] = responseBody["content"];
          print("re:" + mapremark_remark.toString());
        });
      } else {
        print("none remark");
      }
    }
  }

  //TODO 查询“评论”--读后感（GET）
  Future<void> getremark(int j, String dest_id) async {
    final response2 = await http.get(Uri.parse(
        'https://762311c2.r6.cpolar.top/comment_query?type=6&dest_id=$dest_id'));
    if (response2.statusCode == 200) {
      var utf8ResponseBody = utf8.decode(response2.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(utf8ResponseBody);
      if (responseBody.containsKey("size")) {
        setState(() {
          // remark=responseBody["size"].toString();
          mapremark[j] = remark.toString();
          print("ma:" + mapremark[j].toString());
          mapremarkcontent[j] = responseBody["content"];
          print("re:" + mapremarkcontent.toString());
        });
      } else {
        mapremark[j] = "0";
        print("none remark");
      }
      debugPrint("remark:" + remark.toString());
    }
  }

  //TODO 查询”点赞“(GET)
  Future<void> getlike(int j, String dest_id) async {
    final response2 = await http.get(Uri.parse(
        'https://762311c2.r6.cpolar.top/likes_query?type=6&dest_id=$dest_id'));
    if (response2.statusCode == 200) {
      var utf8ResponseBody = utf8.decode(response2.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(utf8ResponseBody);
      if (responseBody.containsKey("size")) {
        setState(() {
          // like=responseBody["size"].toString();
          map[j] = like.toString();
          // print("map[j]:"+map[j].toString());
          // likes=responseBody["content"];
          // print("likes："+likes.toString());
          for (int i = 0; i < likes.length; i++) {
            if (likes[i]["user_id"] == email &&
                likes[i]["dest_id"] == dest_id) {
              mapthumb[j] = true;
              break;
            } else {
              mapthumb[j] = false;
            }
          }
          print("thu" + mapthumb[j].toString());
        });
      } else {
        map[j] = "0";
        mapthumb[j] = false;
        print("none like");
      }
      debugPrint("like:" + like.toString());
    }
  }

  //TODO 添加“点赞”（POST）
  Future<void> postlike(String session_id, String type, String dest_id) async {
    print(dest_id);
    var headers = {
      'Authorization': session_id,
      'User-Agent': 'Apifox/1.0.0 (https://www.apifox.cn)'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://762311c2.r6.cpolar.top/likes_add'));
    request.fields.addAll({'type': type, 'dest_id': dest_id});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      debugPrint("post success");
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  List<Widget> _getData() {
    var temp = bookreview.map((value) {
      // print(value["book_reaction_id"].toString());
      // debugPrint("value:"+value.toString());
      return Card(
          margin: EdgeInsets.all(rpx(10.0)),
          child: Container(
            height: rpx(230.0),
            child: Column(
              children: [
                SizedBox(
                  height: rpx(5.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: rpx(20.0)),
                      child: Text(
                        value["title"],
                        style: TextStyle(fontSize: rpx(20.0)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: rpx(15.0)),
                      child: Text(
                        value["create_time"],
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: rpx(7.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: rpx(20.0)),
                          child: Container(
                            width: rpx(200.0),
                            child: Text(
                              value["content"],
                              style: TextStyle(color: Colors.black38),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/${value["book_reaction_picture"]}",
                      width: rpx(115.0),
                      height: rpx(115.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: rpx(7.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: rpx(20.0), bottom: rpx(5.0))),
                            Image.asset(
                              "images/person.jpg",
                              width: rpx(25.0),
                              height: rpx(25.0),
                            ),
                            Padding(padding: EdgeInsets.only(left: rpx(10.0))),
                            Text(
                              value["user_id"],
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.message),
                              color: Colors.grey,
                              iconSize: rpx(18),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => BookReviewRemarkList(
                                        session_id,
                                        bookreview,
                                        mapremark_remark)));
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left: rpx(10))),
                            Text(mapremark[value["book_reaction_id"]]),
                            Padding(padding: EdgeInsets.only(right: rpx(20.0))),
                            IconButton(
                              icon: mapthumb[value["book_reaction_id"]]
                                  ? Icon(
                                      Icons.favorite,
                                    )
                                  : Icon(Icons.favorite_border),
                              iconSize: rpx(18),
                              onPressed: () {
                                setState(() {
                                  mapthumb[value["book_reaction_id"]] =
                                      !mapthumb[value["book_reaction_id"]];
                                  map[value["book_reaction_id"]] = (int.parse(
                                              map[value["book_reaction_id"]]) +
                                          1)
                                      .toString();
                                  postlike(session_id, "6", value["book_id"]);
                                });
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left: rpx(10))),
                            Text(map[value["book_reaction_id"]]),
                            Padding(padding: EdgeInsets.only(right: rpx(15)))
                          ], //mapthumb[value["book_reaction_id"]]
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ));
    });
    return temp.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("书评"),
          centerTitle: true,
        ),
        body: ListView(children: this._getData()));
  }
}

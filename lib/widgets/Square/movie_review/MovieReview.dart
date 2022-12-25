import 'dart:convert';

import 'package:flutter_application_1/rpx.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieReview extends StatefulWidget {
  String session_id;
  List moviereview;
  String email;
  String likemovie;
  List likesmovie;
  String remarkmovie;
  Map<int, dynamic> mapmovie;
  Map<int, dynamic> mapthumbmovie;
  Map<int, dynamic> mapremarkmovie;
  Map<int, dynamic> mapremarkcontentmovie;
  Map<int, dynamic> mapremark_remarkmovie;
  MovieReview(
      this.session_id,
      this.moviereview,
      this.email,
      this.likemovie,
      this.likesmovie,
      this.remarkmovie,
      this.mapmovie,
      this.mapthumbmovie,
      this.mapremarkmovie,
      this.mapremarkcontentmovie,
      this.mapremark_remarkmovie);
  @override
  MovieReviewState createState() => MovieReviewState(
      session_id: session_id,
      moviereview: moviereview,
      email: email,
      likemovie: likemovie,
      likesmovie: likesmovie,
      remarkmovie: remarkmovie,
      mapmovie: mapmovie,
      mapthumbmovie: mapthumbmovie,
      mapremarkmovie: mapremarkmovie,
      mapremarkcontentmovie: mapremarkcontentmovie,
      mapremark_remarkmovie: mapremark_remarkmovie);
}

class MovieReviewState extends State<MovieReview> {
  MovieReviewState(
      {Key key,
      this.session_id,
      this.moviereview,
      this.email,
      this.likemovie,
      this.likesmovie,
      this.remarkmovie,
      this.mapmovie,
      this.mapthumbmovie,
      this.mapremarkmovie,
      this.mapremarkcontentmovie,
      this.mapremark_remarkmovie})
      : super();
  final String session_id;
  final List moviereview;
  final String email;
  final String likemovie;
  final List likesmovie;
  final String remarkmovie;
  final Map<int, dynamic> mapmovie;
  final Map<int, dynamic> mapthumbmovie;
  final Map<int, dynamic> mapremarkmovie;
  final Map<int, dynamic> mapremarkcontentmovie;
  final Map<int, dynamic> mapremark_remarkmovie;

  @override
  void initState() {
    super.initState();
    // getNetData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getNetMovieReviewData() {
    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 2), () {
        return "hello";
      }),
    ]).then((results) {
      print(results[0]);
      for (int i = 0; i < moviereview.length; i++) {
        Future(() => getmovielike(
            moviereview[i]["movie_reaction_id"], moviereview[i]["movie_id"]));
      }
      for (int i = 0; i < moviereview.length; i++) {
        Future(() => getmovieremark(
            moviereview[i]["movie_reaction_id"], moviereview[i]["movie_id"]));
      }
      for (int k in mapremarkcontentmovie.keys) {
        //k是moviereview的id
        Future(() => getmovieremark_remark(
            mapremarkcontentmovie[k]["comment_id"], k.toString()));
      }
    }).catchError((e) {
      print(e);
    });
  }

  //TODO 查询“评论”--评论（GET）
  Future<void> getmovieremark_remark(int j, String dest_id) async {
    final response2 = await http.get(Uri.parse(
        'https://762311c2.r6.cpolar.top/comment_query?type=8&dest_id=$dest_id'));
    if (response2.statusCode == 200) {
      var utf8ResponseBody = utf8.decode(response2.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(utf8ResponseBody);
      if (responseBody.containsKey("size")) {
        setState(() {
          mapremark_remarkmovie[j] = responseBody["content"];
          print("re:" + mapremark_remarkmovie.toString());
        });
      } else {
        print("none remark");
      }
    }
  }

  //TODO 查询“评论”--观后感（GET）
  Future<void> getmovieremark(int j, String dest_id) async {
    final response2 = await http.get(Uri.parse(
        'https://762311c2.r6.cpolar.top/comment_query?type=5&dest_id=$dest_id'));
    if (response2.statusCode == 200) {
      var utf8ResponseBody = utf8.decode(response2.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(utf8ResponseBody);
      if (responseBody.containsKey("size")) {
        setState(() {
          // remark=responseBody["size"].toString();
          mapremarkmovie[j] = remarkmovie.toString();
          print("ma:" + mapremarkmovie[j].toString());
          mapremarkcontentmovie[j] = responseBody["content"];
          print("re:" + mapremarkcontentmovie.toString());
        });
      } else {
        mapremarkmovie[j] = "0";
        print("none remark");
      }
      debugPrint("remark:" + remarkmovie.toString());
    }
  }

  //TODO 查询”点赞“(GET)
  Future<void> getmovielike(int j, String dest_id) async {
    final response2 = await http.get(Uri.parse(
        'https://762311c2.r6.cpolar.top/likes_query?type=5&dest_id=$dest_id'));
    if (response2.statusCode == 200) {
      var utf8ResponseBody = utf8.decode(response2.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(utf8ResponseBody);
      if (responseBody.containsKey("size")) {
        setState(() {
          // like=responseBody["size"].toString();
          mapmovie[j] = likemovie.toString();
          // print("map[j]:"+map[j].toString());
          // likes=responseBody["content"];
          // print("likes："+likes.toString());
          for (int i = 0; i < likesmovie.length; i++) {
            if (likesmovie[i]["user_id"] == email &&
                likesmovie[i]["dest_id"] == dest_id) {
              mapthumbmovie[j] = true;
              break;
            } else {
              mapthumbmovie[j] = false;
            }
          }
          print("thu" + mapthumbmovie[j].toString());
        });
      } else {
        mapmovie[j] = "0";
        mapthumbmovie[j] = false;
        print("none like");
      }
      debugPrint("like:" + likemovie.toString());
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
        'POST', Uri.parse('http://638ca501.r2.cpolar.cn/likes_add'));
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
    var temp = moviereview.map((value) {
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
                      "images/${value["movie_reaction_picture"]}",
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
                              onPressed: () {},
                            ),
                            Padding(padding: EdgeInsets.only(left: rpx(10))),
                            Text(mapremarkmovie[value["movie_reaction_id"]]),
                            Padding(padding: EdgeInsets.only(right: rpx(20.0))),
                            IconButton(
                              icon: mapthumbmovie[value["movie_reaction_id"]]
                                  ? Icon(
                                      Icons.favorite,
                                    )
                                  : Icon(Icons.favorite_border),
                              iconSize: rpx(18),
                              onPressed: () {
                                setState(() {
                                  mapthumbmovie[value["movie_reaction_id"]] =
                                      !mapthumbmovie[
                                          value["movie_reaction_id"]];
                                  mapmovie[value["movie_reaction_id"]] =
                                      (int.parse(mapmovie[
                                                  value["movie_reaction_id"]]) +
                                              1)
                                          .toString();
                                  postlike(session_id, "6", value["movie_id"]);
                                });
                              },
                            ),
                            Padding(padding: EdgeInsets.only(left: rpx(10))),
                            Text(mapmovie[value["movie_reaction_id"]]),
                            Padding(padding: EdgeInsets.only(right: rpx(15)))
                          ], //mapthumbmovie[value["movie_reaction_id"]]
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
          title: Text("影评"),
          centerTitle: true,
        ),
        body: ListView(children: this._getData()));
  }
}

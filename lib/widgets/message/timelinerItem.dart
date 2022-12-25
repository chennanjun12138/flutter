import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/movie.dart';
import 'package:flutter_application_1/model/moviedan.dart';
import 'package:flutter_application_1/model/movielist.dart';
import 'package:flutter_application_1/model/textdraw.dart';
import 'package:flutter_application_1/model/watch.dart';
import 'package:flutter_application_1/widgets/message/addyingping.dart';
import 'package:flutter_application_1/widgets/message/messagenote2.dart';

class MovieListItem extends StatelessWidget {
  movie movie1;
  watch w;
  List<movie> movies;
  List<moviedan> yingdans = [];
  String session_id;
  MovieListItem(
      this.movie1, this.w, this.movies, this.yingdans, this.session_id);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 10, color: Color(0xffe2e2e2)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 2.具体内容
          getMovieContentWidget(context),
          SizedBox(height: 12),
          // 3.电影简介
        ],
      ),
    );
  }

  // 具体内容
  Widget getMovieContentWidget(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContentDesc(context),
          getContentImage(context),
        ],
      ),
    );
  }

  Widget getContentImage(BuildContext context) {
    String url = "assets/images/${movie1.movie_picture}";
    String url2 = "assets/images/saohei.webp";
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => messagenote2(
                  m1: movie1,
                  yingdans: yingdans,
                  movies: movies,
                  w: w,
                )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(url == "assets/images/" ? url2 : url),
        // child: Image.asset("assets/images/${movies.movie_picture}"),
      ),
    );
  }

  Widget getContentDesc(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget(),
            SizedBox(
              height: 8,
            ),
            getInfoWidget(),
            SizedBox(
              height: 8,
            ),
            Container(
              width: 150,
              height: 30,
              child: gettime(),
            ),
            SizedBox(
              height: 8,
            ),
            getbutton(context),
          ],
        ),
      ),
    );
  }

  Widget gettime() {
    return Container(
      height: 40,
      width: 100,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border:
              new Border.all(width: 1, color: Color.fromARGB(255, 79, 78, 78))),
      child: TextIcon(
        textSpanText: "${w.create_time.substring(0, 10)}",
        icon: Icons.calendar_month,
        iconColor: Color.fromARGB(137, 32, 72, 183),
      ),
    );
  }

  Widget getbutton(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => yingping(
                    m1: movie1,
                    session_id: session_id,
                  )));
        },
        child: Text("添加影评"));
  }

  Widget getTitleWidget() {
    return Stack(
      children: <Widget>[
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: movie1.movie_name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ]),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget getInfoWidget() {
    // 1.获取种类字符串
    final genres = movie1.movie_type;
    final director = movie1.director;
    var castString = movie1.main_performer;

    // 2.创建Widget
    return Text(
      "$genres / $director / $castString",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 10),
    );
  }
}

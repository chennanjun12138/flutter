import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/book.dart';
import 'package:flutter_application_1/model/movie.dart';
import 'package:flutter_application_1/model/moviedan.dart';
import 'package:flutter_application_1/model/watch.dart';
import 'package:flutter_application_1/widgets/booktotal/addreadsense.dart';
import 'package:flutter_application_1/model/yueduzhuangtai.dart';
import 'package:flutter_application_1/widgets/message/messagenote.dart';
import 'package:flutter_application_1/widgets/message/messagenote2.dart';
import 'package:flutter_application_1/widgets/message/messagenote3.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_application_1/widgets/booktotal/addDigest.dart';

class messageImage extends StatelessWidget {
  // final book book1;
  // final yuduzhuangtai read1;

  // bookImage(this.read1, this.book1);
  movie m1;
  List<movie> movies;
  List<movie> yikanmovies = [];
  List<movie> planmovies = [];
  List<moviedan> yingdans = [];
  List<watch> watchs = [];
  messageImage(this.m1, this.movies, this.yikanmovies, this.planmovies,
      this.yingdans, this.watchs);
  @override
  Widget build(BuildContext context) {
    print("messageImage:${yingdans.length}");
    String url = "assets/images/${m1.movie_picture}";
    String url2 = "assets/images/saohei.webp";
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new ExactAssetImage(url == "assets/images/" ? url2 : url),
          ),
        ),
      ),
      onTap: () {
        int flag = 0;
        for (int i = 0; i < yikanmovies.length; i++) {
          if (m1.movie_id == yikanmovies[i].movie_id) {
            flag = 1;
            break;
          }
        }
        for (int i = 0; i < planmovies.length; i++) {
          if (m1.movie_id == planmovies[i].movie_id) {
            flag = 2;
            break;
          }
        }
        if (flag == 1) {
          int k = 0;
          for (int i = 0; i < watchs.length; i++) {
            if (watchs[i].movie_id.toString() == m1.movie_id.toString()) {
              k = i;
              break;
            }
          }
          //已看
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => messagenote2(
                    m1: m1,
                    yingdans: yingdans,
                    movies: movies,
                    w: watchs[k],
                  )));
        } else if (flag == 2) {
          //计划看
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => messageset(
                    m1: m1,
                    yingdans: yingdans,
                    movies: movies,
                  )));
        } else {
          //未看
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => messagenote(
                    m1: m1,
                    yingdans: yingdans,
                    movies: movies,
                  )));
        }
      },
    );
  }
}

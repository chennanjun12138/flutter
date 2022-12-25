import 'package:flutter/material.dart';

class shudan extends StatelessWidget {
  // final List<book> book1;
  // final yuduzhuangtai read1;
  //final yuduzhuangtai read;
  // BuildContext context2;
  //shudan();
  int bookid = 0;
  @override
  Widget build(BuildContext context) {
    // bookid = int.parse(read1.book_id);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border:
              new Border.all(width: 1, color: Color.fromARGB(255, 79, 78, 78))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 2.具体内容
          getMovieContentWidget(),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget getMovieContentWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: getContentImage(),
        ),
        getContentDesc(),
      ],
    );
  }

  Widget getContentImage() {
    return Image(
      image: AssetImage('assets/images/1668557646608.webp'),
      height: 120,
    );
  }

  Widget getContentDesc() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTitleWidget(),
              SizedBox(
                height: 10,
              ),
              Text(
                "收藏量 180次",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 222, 183, 75)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "3本   ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 20, 20),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "by 一条鱼",
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 20, 20),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  ClipOval(
                    //圆形头像
                    child: new Image.asset(
                      'assets/images/beijin.jpg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "创建时间：2011-11-23 11:30",
                style: TextStyle(
                    color: Color.fromARGB(255, 37, 36, 36),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }

  Widget getTitleWidget() {
    return Stack(
      children: <Widget>[
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: "令人看后久久不能平静的作品",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                )),
          ]),
          maxLines: 2,
        ),
      ],
    );
  }
}

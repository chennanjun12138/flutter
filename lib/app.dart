import 'package:flutter/material.dart';
import 'package:flutter_application_1/find.dart';
import 'package:flutter_application_1/widgets/Square/SquarePage.dart';
import 'message.dart';
import 'mypage.dart';
import 'shouye.dart';
//import 'package:http/http.dart' as http;

//主界面
class MyApp2 extends StatefulWidget {
  String session_id, userid;
  MyApp2(
    this.session_id,
    this.userid,
  );
  @override
  MyAppState createState() => new MyAppState(session_id, userid);
}

class MyAppState extends State<MyApp2> with SingleTickerProviderStateMixin {
  TabController controller;
  String session_id, userid;
  MyAppState(
    this.session_id,
    this.userid,
  );
  @override
  void initState() {
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("userid:${userid}");
    return new MaterialApp(
      home: new Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new first(session_id, userid),
            SingleChildScrollView(
              child: new Message(
                session_id: session_id,
              ),
            ),
            new Find(),
            new Mypage(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[
              new Tab(
                text: "书籍",
                icon: new Icon(Icons.library_books),
              ),
              new Tab(
                text: "电影",
                icon: new Icon(Icons.local_movies),
              ),
              new Tab(
                text: "发现",
                icon: new Icon(Icons.find_in_page_sharp),
              ),
              new Tab(
                text: "我的",
                icon: new Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

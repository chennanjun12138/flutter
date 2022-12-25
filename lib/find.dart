import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Find extends StatefulWidget {
  @override
  FindState createState() => new FindState();
}

class FindState extends State<Find> {
  List _list = ["loading"];

  //自定义的scrollController

  ScrollController _scroll = new ScrollController();

  bool isOver = false;

  bool hasTop = false; //是否展示返回顶部按钮
  @override
  void initState() {
    super.initState();
    _retrieveData();
    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent &&
          !isOver) {
        _retrieveData();
      }
      //超过500，就显示返回顶部按钮，小于500就不展示

      if (_scroll.offset >= 500 && !hasTop) {
        setState(() {
          hasTop = true;
        });
      } else if (_scroll.offset < 500 && hasTop) {
        setState(() {
          hasTop = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Widget _getList() {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: ListView.builder(
            controller: _scroll, //scroll的配置
            itemCount: _list.length,
            itemExtent: 60.0,
            itemBuilder: (context, index) {
              if (_list[index] == "loading") {
                if (_list.length >= 50) {
                  isOver = true; //是否已经结束
                  return Row(
                    children: <Widget>[Text("没有更多了")],
                    mainAxisAlignment: MainAxisAlignment.center,
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0)),
                    ],
                  );
                }
              }
              return ListTile(
                title: Text(_list[index]),
              );
            },
          ),
        )
      ],
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _list.insertAll(
            _list.length - 1,
            //每次生成20个单词
            generateWordPairs().take(100).map((e) => e.asPascalCase).toList());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("list"),
      ),
      body: _getList(),
      //返回顶部按钮
      floatingActionButton: hasTop
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scroll.animateTo(.0,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
            )
          : null,
    );
  }
}

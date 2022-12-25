import 'package:flutter/material.dart';

class readsense extends StatelessWidget {
  const readsense({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 166, 162, 162),
          title: Text("读后有感"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              tooltip: '保存',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: new SingleChildScrollView(
            child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(hintText: "请填写标题(二十个子以内)"),
                  // 绑定控制器
                  // controller: _username,
                  // 输入改变以后的事件
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 130, 132, 134))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        autocorrect: false,
                        keyboardType: TextInputType.multiline,
                        minLines: 20,
                        maxLines: 20,
                        decoration: InputDecoration(
                          hintText: "请填写文字或图片",
                          filled: true,
                          fillColor: Color(0xFFF2F2F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      Container(
                          width: 180,
                          alignment: Alignment(-1, -1),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 151, 157, 164)),
                            color: Color.fromARGB(255, 143, 143, 140),
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                iconSize: 150,
                                icon: const Icon(
                                  Icons.add,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          )),
                    ],
                  ),
                )
                // 多行文本输入框
              ],
            ),
          ),
        )));
  }
}

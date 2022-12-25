import 'package:flutter/material.dart';

class addbook extends StatelessWidget {
  // const addbook({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new ExactAssetImage('assets/images/beijin.jpg'),
          ),
        ),
        child: Container(
          color: Color.fromARGB(255, 63, 49, 114).withOpacity(.5),
          alignment: Alignment.center,
          child: Center(
            // 末端按钮对齐的容器
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              // child大小
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                picAndTextButton(),
                picAndTextButton2(),
                picAndTextButton3(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget picAndTextButton() {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 239, 168, 2),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 10,
          ),
          Text("扫二维码")
        ],
      ),
    );
  }

  Widget picAndTextButton2() {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 9, 203, 112),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: const Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text("搜索书籍")
        ],
      ),
    );
  }

  Widget picAndTextButton3() {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 47, 22, 172),
                  style: BorderStyle.solid,
                ),
              ),
            ),
            onPressed: () {},
            child: const Icon(Icons.file_copy_rounded),
          ),
          SizedBox(
            height: 10,
          ),
          Text("手动录入")
        ],
      ),
    );
  }
}

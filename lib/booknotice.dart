import 'package:flutter/material.dart';
import 'booknoticeItem.dart';

class bookpingjia extends StatelessWidget {
  const bookpingjia({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          title: Center(
            child: Text("《活着》书评"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("写书评",
                  style: TextStyle(color: Color.fromARGB(255, 214, 122, 24))),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          children: [
            _buildSuggestions(),
          ],
        ));
  }

  Widget _buildSuggestions() {
    return new Expanded(
      child: new ListView.builder(
        padding: const EdgeInsets.all(16.0), // 设置padding
        itemBuilder: (context, index) {
          return shudan();
        },
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 2,
      ),
    );
  }
}

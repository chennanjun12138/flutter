import 'package:flutter/material.dart';

class GridViewBaseUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///构建九宫格数据数据
      body: buildGridView1(),
    );
  }

  ///GridView 的基本使用
  ///通过构造函数来创建
  Widget buildGridView1() {
    return GridView(
      ///子Item排列规则
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 3,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4),

      ///GridView中使用的子Widegt
      children: buildListViewItemList(),
    );
  }

  ///GridView 的基本使用
  ///通过custom方式来创建
  Widget buildGridView() {
    return GridView.custom(
        cacheExtent: 200,

        ///子Item排列规则
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          ///子Item的最大宽度
          maxCrossAxisExtent: 100,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4,
        ),

        ///子条目的构建模式
        childrenDelegate:

            ///懒加载的模式
            SliverChildBuilderDelegate((BuildContext context, int index) {
          return buildListViewItemWidget(index);
        }));
  }

  List<Widget> buildListViewItemList() {
    List<Widget> list = [];

    ///模拟的8条数据
    for (int i = 0; i < 9; i++) {
      list.add(buildListViewItemWidget(i));
    }
    list.add(ADD());
    return list;
  }

  ///创建GridView使用的子布局
  Widget buildListViewItemWidget(int index) {
    return new Container(
      ///内容剧中
      alignment: Alignment.center,

      ///根据角标来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }

  Widget ADD() {
    return new Container(
      alignment: Alignment.center,
      color: Color.fromARGB(255, 202, 186, 186),
      child: IconButton(
        iconSize: 80,
        icon: const Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'CommonWidget.dart';

class ListViewPage extends CommonWidget {
  ListViewPage(String title) : super(title);

  @override
  getBody(BuildContext context) {
    return new AddListView();
  }

  @override
  getFab(BuildContext context) {}
}

class AddListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AddListViewState();
  }
}

class AddListViewState extends State<AddListView> {
  List<String> data = [];

  @override
  void initState() {
    data.add("你好");
    data.add("哈哈");
    data.add("呵呵");
    data.add("丫丫");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          String name = '第' + data[index] + "条";
          return getRowByName(name);
        });
  }

  getRowByName(String name) {
    return new GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: new Text(name),
      ),
      onTap: () {
        setState(() {
          data.add("haha");
        });
      },
    );
  }

  getRow(int index) {
    String name = '第' + index.toString() + "条";
    return getRowByName(name);
  }
}

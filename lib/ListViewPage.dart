import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'CommonWidget.dart';

class ListViewPage extends CommonWidget {
  ListViewPage(String title) : super(title);

  @override
  getBody(BuildContext context) {
    List<String> data = ["你好", "他好", "丫丫", "呵呵"];
    for (var i = 0; i < 50; ++i) {
      data.add("第" + i.toString() + "条");
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          String name = '第' + data[index] + "条";
          return new GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: new Text(name),
            ),
            onTap: () {},
          );
        });
  }

  @override
  getFab() {}
}

class TText extends StatefulWidget {
  String name;

  @override
  State<StatefulWidget> createState() => TTextState(name);

  TText(this.name);
}

class TTextState extends State<TText> {
  String name;

  @override
  Widget build(BuildContext context) {
    return new Text(name);
  }

  TTextState(this.name);
}

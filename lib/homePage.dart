import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:android_intent/android_intent.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("这是HomePage"),
      ),
      body: new Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 10.0,
          runSpacing: 10.0,
          children: <Widget>[
            Image.asset("assets/my_pic2.gif"),
            Tooltip(
              message: "这是一个Tootip",
              verticalOffset: 100.0,
              preferBelow: true,
              child: Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539236908555&di=f1a54f3a34e06fb2c4ccb7862758cc11&imgtype=0&src=http%3A%2F%2Fimg2.touxiang.cn%2Ffile%2F20160420%2F4ec66a32636c11db32788d958b61da54.jpg"),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("page2");
          }),
    );
  }
}

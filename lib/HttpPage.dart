import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:android_intent/android_intent.dart';
import 'homePage.dart';
import 'PageTwo.dart';
import 'PageThree.dart';
import 'package:flutterstudy/IntentPage.dart';
import 'CommonWidget.dart';
import 'package:http/http.dart' as http;

class HttpPage extends CommonWidget {
  HttpPage(String title) : super(title);

  @override
  getBody(BuildContext context) => new ImageView();

  @override
  getFab() {
    return null;
  }
}

class ImageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ImageViewState();
  }
}

class ImageViewState extends State<ImageView> {
  String data = "aaa";

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Wrap(
        children: <Widget>[
          new Text(data),
          new RaisedButton(onPressed: () {
            loadData();
          })
        ],
      ),
    );
  }

  loadData() async {
    String dataURL =
        "http://mobile.weather.com.cn/data/sk/101010100.html?_=1381891661455";
    http.Response response = await http.get(dataURL);

    setState(() {
      data = response.body;
    });
  }
}

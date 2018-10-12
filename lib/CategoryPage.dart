import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:android_intent/android_intent.dart';
import 'homePage.dart';
import 'PageTwo.dart';
import 'PageThree.dart';
import 'package:flutterstudy/IntentPage.dart';
import 'CommonWidget.dart';

class CategoryPage extends CommonWidget {
  CategoryPage(String title) : super(title);

  @override
  getBody(BuildContext context) {
    return new ListView(
      children: <Widget>[
        getRaiseBtn(() {
          Navigator.of(context).pushNamed("http");
        }, "Http Request Page"),
        getRaiseBtn(() {
          Navigator.of(context).pushNamed("isolate");
        }, "Isolate Page"),
        getRaiseBtn(() {
          Navigator.of(context).pushNamed("listview");
        }, "ListView Test")
      ],
    );
  }

  @override
  getFab() {
    return null;
  }

  getRaiseBtn(VoidCallback c, String text) {
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: new RaisedButton(
        onPressed: c,
        child: new Text(text),
      ),
    );
  }
}

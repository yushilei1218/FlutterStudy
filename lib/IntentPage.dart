import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:android_intent/android_intent.dart';
import 'package:flutterstudy/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntentPage extends CommonWidget {
  IntentPage(String title) : super(title);

  @override
  getBody(BuildContext c) {
    return new Center(
      child: TText(),
    );
  }

  @override
  getFab(BuildContext context) {
    return new FloatingActionButton(
        child: Image.asset("assets/my_pic1.png"), onPressed: () {});
  }
}

class TText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TTextState();
  }
}

class TTextState extends State<TText> {
  String content = WordPair.random().asUpperCase;
  String changeUri;


//  @override
//  void initState() {
//    getUri();
//  }

  change() {
    setState(() {
      content = changeUri;
    });
  }

  @override
  Widget build(BuildContext context) {
   return new RaisedButton(
      onPressed: getUri,
      child: new Text(content),
    );
  }

  getUri() async {
    MethodChannel f = new MethodChannel("This_is_channel");
    String uri = await f.invokeMethod("getUri");
    if (uri != null) {
      changeUri = uri;
      change();
    }
  }
}

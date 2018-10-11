import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:android_intent/android_intent.dart';
import 'homePage.dart';
import 'PageTwo.dart';
import 'PageThree.dart';
import 'package:flutterstudy/IntentPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "home": (BuildContext context) => HomePage(),
        "page2": (BuildContext context) => PageTwo(),
        "page3": (BuildContext context) => PageThree(),
        "page4": (BuildContext context) => IntentPage("这是一个IntentPage"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String url =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539236908555&di=f1a54f3a34e06fb2c4ccb7862758cc11&imgtype=0&src=http%3A%2F%2Fimg2.touxiang.cn%2Ffile%2F20160420%2F4ec66a32636c11db32788d958b61da54.jpg";
  bool isAdd = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void changeImage() {
    setState(() {
      isAdd = !isAdd;
      url =
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539236983870&di=840005dc9380fae63f94ea72fab75913&imgtype=0&src=http%3A%2F%2Fp1.gexing.com%2Ftouxiang%2F20120810%2F1502%2F5024b21a40af6_200x200_3.jpg";
    });
  }

  void openActivity() {
    AndroidIntent intent = new AndroidIntent(
      action: 'android.intent.action.VIEW',
      data: 'damai://member_ticketwalletlist',
    );
    intent.launch();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            new Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.end,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                new Text(
                  WordPair.random().asUpperCase,
                  style: TextStyle(color: Colors.red),
                ),
                new Image.asset(
                  'assets/my_pic1.png',
                  width: 50.0,
                  height: 50.0,
                ),
                new Image.asset(
                  "assets/my_pic2.gif",
                  width: isAdd ? 50.0 : 100.0,
                  height: isAdd ? 50.0 : 100.0,
                ),
              ],
            ),
            new Image(
              image: new NetworkImage(url),
              width: 200.0,
              height: 200.0,
              alignment: Alignment.topRight,
            ),
            new MaterialButton(
              height: 50.0,
              minWidth: 50.0,
              child: new Text("这是一个MaterialButton"),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          changeImage();
          _incrementCounter();
          openActivity();
        },
        tooltip: WordPair.random().asUpperCase,
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

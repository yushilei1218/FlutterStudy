import 'package:flutter/material.dart';
import 'homePage.dart';
import 'PageTwo.dart';
import 'PageThree.dart';
import 'package:flutterstudy/IntentPage.dart';
import 'CategoryPage.dart';
import 'HttpPage.dart';
import 'ListViewPage.dart';
import 'BatteryPluginPage.dart';

class RouteHolder {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      "home": (BuildContext context) {
        return new HomePage();
      },
      "page2": (BuildContext context) => PageTwo(),
      "page3": (BuildContext context) => PageThree(),
      "page4": (BuildContext context) => IntentPage("这是一个IntentPage"),
      "category": (BuildContext context) => CategoryPage("这是一个CategoryPage"),
      "http": (BuildContext context) => HttpPage("这是一个CategoryPage"),
      "listview": (BuildContext context) => ListViewPage("这是一个ListViewPage"),
      "battery": (BuildContext context) => BatteryPlugin("这是一个电量监听"),
    };
  }
}

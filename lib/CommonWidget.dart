import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:android_intent/android_intent.dart';

abstract class CommonWidget extends StatelessWidget {
  final String title;

  CommonWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(title),
      ),
      body: getBody(context),
      floatingActionButton: getFab(context),
    );
  }

  getBody(BuildContext context);

  getFab(BuildContext context);
}

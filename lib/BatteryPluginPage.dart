import 'package:flutter/src/widgets/framework.dart';
import 'package:battery/battery.dart';
import 'CommonWidget.dart';
import 'package:flutter/material.dart';

class BatteryPlugin extends CommonWidget {
  BatteryPlugin(String title) : super(title);

  @override
  getBody(BuildContext context) {
    return new Center(
      child: new TText(),
    );
  }

  @override
  getFab(BuildContext context) {
    return null;
  }
}

class TText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TTextState();
  }
}

class TTextState extends State<TText> {
  Battery _battery = new Battery();
  BatteryState myState;
  var listen;

  @override
  void initState() {
    listen = _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        myState = state;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (listen != null) {
      listen.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Text('$myState'),
      onTap: () async {
        int i = await _battery.batteryLevel;
        showDialog(
            context: context,
            builder: (context) {
              return new AlertDialog(
                title: new Text("这是一个电量提醒的对话框title"),
                content: new Text('电量 $i %'),
                actions: <Widget>[
                  new FlatButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      },
    );
  }
}

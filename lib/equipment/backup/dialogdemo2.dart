import 'package:flutter/material.dart';

main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test', 
      home: new TestMyApp()
    );
  }
}

class TestMyApp extends StatefulWidget {
  @override
  TestMyAppState createState() => new TestMyAppState();
}

class TestMyAppState extends State<TestMyApp> {

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //padding
      child: new Text(
        'test dialog'
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
          title: new Text("Dialog Title"),
          content: new Text("This is is a dialog"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("CANCEL"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ])
        );
      }
    );
  }


}
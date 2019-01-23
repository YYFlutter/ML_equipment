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
    return new MaterialApp(title: 'Test', home: new TestMyApp());
  }
}

class TestMyApp extends StatefulWidget {
  @override
  TestMyAppState createState() => new TestMyAppState();
}

enum DialogItemAction {
  cancel,
  agree,
}

class TestMyAppState extends State<TestMyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(title: const Text('Dialogs')),
        body: _buildCenterButton(context));
  }

  Widget _buildCenterButton(BuildContext context) {
    return new Container(
        alignment: Alignment.center,
        child: new Container(
          child: _buildButton(context),
        ));
  }

  Widget _buildButton(BuildContext context) {
    return new RaisedButton(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        //padding
        child: new Text(
          'test dialog',
          style: new TextStyle(
            fontSize: 18.0, //textsize
            color: Colors.white, // textcolor
          ),
        ),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        //shadow
        splashColor: Colors.blueGrey,
        onPressed: () {
          showDemoDialog<DialogItemAction>(
              context: context,
              child: new AlertDialog(
                  title: new Text("Dialog Title"),
                  content: new Text("This is is a dialog"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("CANCEL"),
                      onPressed: () {
                        Navigator.pop(context, DialogItemAction.cancel);
                      },
                    ),
                    new FlatButton(
                      child: new Text("OK"),
                      onPressed: () {
                        Navigator.pop(context, DialogItemAction.agree);
                      },
                    )
                  ]));
        });
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(
            new SnackBar(content: new Text('hey, You selected: $value')));
      }
    });
  }
}

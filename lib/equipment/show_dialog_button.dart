import 'package:flutter/material.dart';
import 'dialog.dart';

class ShowDialogButton extends StatefulWidget {
  @override
  _ShowDialogButtonState createState() => _ShowDialogButtonState();
}

class _ShowDialogButtonState extends State<ShowDialogButton> {
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
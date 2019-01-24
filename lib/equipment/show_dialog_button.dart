import 'package:flutter/material.dart';
import 'modalroute.dart';

class ShowDialogButton extends StatefulWidget {
  @override
  _ShowDialogButtonState createState() => _ShowDialogButtonState();
}

class _ShowDialogButtonState extends State<ShowDialogButton> {
  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay(
      eqid: 3206,
      eqids: [3110, 3206, 3201, 3202]
    ));
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //padding
      child: new Text(
        'test dialog'
      ),
      onPressed: () => _showOverlay(context)
    );
  }
}
import 'package:flutter/material.dart';
import 'modalroute.dart';

class ShowDialogButton extends StatefulWidget {
  @override
  _ShowDialogButtonState createState() => _ShowDialogButtonState();
}

class _ShowDialogButtonState extends State<ShowDialogButton> {
  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay());
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
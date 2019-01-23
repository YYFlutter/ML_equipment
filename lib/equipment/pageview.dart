import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: EquipmentPageView(),
    ));

class EquipmentPageView extends StatefulWidget {
  @override
  _EquipmentPageViewState createState() => _EquipmentPageViewState();
}

class _EquipmentPageViewState extends State<EquipmentPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.cyan,
        ),
        Container(
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
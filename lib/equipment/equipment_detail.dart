import 'package:flutter/material.dart';

class EquipmentDetail extends StatefulWidget {
  @override
  _EquipmentDetailState createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height - 130,
            color: Color(0xFF2D2F33)
          ),
          RaisedButton(
            child: new Text('X'),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}
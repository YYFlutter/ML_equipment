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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFF2D2F33),
            ),
          ),
          ButtonTheme(
            minWidth: 50.0,
            child: RaisedButton(
              color: Color(0xFF2a2e30),
              child: new Text('X', style: TextStyle(color: Color(0xFFFFFFFF)),),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          )
        ],
      )
    );
  }
}
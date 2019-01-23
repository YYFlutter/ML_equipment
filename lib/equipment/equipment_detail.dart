import 'package:flutter/material.dart';

class EquipmentDetail extends StatefulWidget {
  @override
  _EquipmentDetailState createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xFF2D2F33),
      ),
    );
  }
}
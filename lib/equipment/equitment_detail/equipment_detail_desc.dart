import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: EquipmentDetailDesc(),
    ));

class EquipmentDetailDesc extends StatefulWidget {
  EquipmentDetailDesc({Key key, this.equipmentData}): super(key: key);
  final Map equipmentData;
  @override
  _EquipmentDetailDescState createState() => _EquipmentDetailDescState();
}

class _EquipmentDetailDescState extends State<EquipmentDetailDesc> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.6,
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(super.widget.equipmentData['statusEffect'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0)),
          Text('unique: ${super.widget.equipmentData['unique']}, ${super.widget.equipmentData['uniquePassive']}', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0))
        ]
      )
    );
  }
}
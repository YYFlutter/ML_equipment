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
        children: getMainColumnArray(super.widget.equipmentData)
      )
    );
  }

  List<Widget> getMainColumnArray(equipmentData){
    List<Widget> rsArray=[];
    if(equipmentData['statusEffect']!=null){
      rsArray.add(getStatusEffect(equipmentData));
    }
    rsArray.add(getEquipmentDesc(equipmentData));
    return rsArray;
  }

  Widget getStatusEffect(equipmentData) {
    Widget resultWG=Divider();
    if(equipmentData['statusEffect'] != null){
      resultWG = Text(super.widget.equipmentData['statusEffect'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0));
    }
    return resultWG;
  }

  Widget getEquipmentDesc(equipmentData) {
    Widget resultWG = Divider();
    if(equipmentData['uniquePassive'] == null) {
      equipmentData['uniquePassive'] = '';
    }
    if(equipmentData['unique'] != null) {
      resultWG = Text('unique: ${equipmentData['unique']}, ${equipmentData['uniquePassive']}', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0));
    } else {
      resultWG = Text('${equipmentData['uniquePassive']}', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0));
    }
    return resultWG;
  }
}
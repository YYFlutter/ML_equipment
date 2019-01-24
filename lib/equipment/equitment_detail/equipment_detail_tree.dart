import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: EquipmentDetailTree(),
    ));

class EquipmentDetailTree extends StatefulWidget {
  EquipmentDetailTree({Key key, this.equipmentData}): super(key: key);
  final Map equipmentData;
  @override
  _EquipmentDetailTreeState createState() => _EquipmentDetailTreeState();
}

class _EquipmentDetailTreeState extends State<EquipmentDetailTree> {
  List _materialList;
  Map _curEquipment;
  @override
  void initState() {
    this._materialList = super.widget.equipmentData['materialList'];
    this._curEquipment = super.widget.equipmentData;
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return buildTreeList();
  }

  Widget equipMentUtil(Map equipMentData) {
    return Column(
      children: <Widget>[
        Container(
          child: Image.network(equipMentData['image'], width: 40.0, height: 40.0),
          margin: EdgeInsets.only(bottom: 5.0),
        ),
        Opacity(
          opacity: 0.4,
          child: Text(equipMentData['name'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 10.0)),
        )
      ],
    );
  }

  Widget buildTreeList() {
    List<Widget> tiles = [];
    Widget content;
    tiles.add(
      equipMentUtil(_curEquipment)
    );
    if(_materialList!= null){
      List<Widget> lineSecond = [];
      for(var index = 0; index < _materialList.length; index++){
        lineSecond.add(
          equipMentUtil(_materialList[index])
        );
      }
      tiles.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: lineSecond,
        )
      );
    }
    content = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: tiles
    );
    return content;
  }
}
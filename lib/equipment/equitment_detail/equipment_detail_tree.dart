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

  // 装备图像
  Widget equipMentUtil(Map equipMentData, int equipType) {
    double coverSize = (equipType == 1 ? 40.0 : 28.0 );
    double fontSize = (equipType == 1 ? 10.0 : 8.0 );
    Widget nameText;
    if(equipType == 1){
      nameText = Text(equipMentData['name'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: fontSize));
    } else {
      List nameArray = equipMentData['name'].split(' ');
      List<Widget> nameTextChilds = [];
      for(int index = 0; index < nameArray.length; index++){
        nameTextChilds.add(
          Text(nameArray[index], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: fontSize))
        );
      }
      nameText = Column(
        children: nameTextChilds,
      );
    }
    return Column(
      children: <Widget>[
        Container(
          child: Image.network(equipMentData['image'], width: coverSize, height: coverSize),
          margin: EdgeInsets.only(bottom: 5.0),
        ),
        Opacity(
          opacity: 0.4,
          child: nameText,
        )
      ],
    );
  }

  // 二级分支
  Widget equipMentSecondUtil(Map equipMentData) {
    List<Widget> thirdLine = [];
    if(equipMentData['materialList']!= null && equipMentData['materialList'].length > 0){
      for(int index = 0; index < equipMentData['materialList'].length; index++){
        thirdLine.add(
          Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            child: equipMentUtil(equipMentData['materialList'][index], 2),
          )
        );
      }
    }

    if(thirdLine.length > 0){
      return Column(
        children: <Widget>[
          Container(
            height: 80.0,
            child: equipMentUtil(equipMentData, 1),
          ),
          Container(
            height: 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: thirdLine,
            ),
          )
        ],
      );
    }else{
      return Column(
        children: <Widget>[
          Container(
            height: 160.0,
            child: equipMentUtil(equipMentData, 1),
          )
        ],
      );
    }

    
  }

  Widget buildTreeList() {
    List<Widget> tiles = [];
    Widget content;
    tiles.add(
      Container(
        height: 80.0,
        child: equipMentUtil(_curEquipment, 1)
      )
    );
    if(_materialList!= null){
      List<Widget> lineSecond = [];
      for(var index = 0; index < _materialList.length; index++){
        // 第二层
        lineSecond.add(
          equipMentSecondUtil(_materialList[index])
        );
      }
      tiles.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
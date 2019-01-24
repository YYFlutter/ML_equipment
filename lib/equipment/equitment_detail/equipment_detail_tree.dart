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
  Widget equipMentUtil(Map equipMentData, int equipType, int brotherNum) {
    double coverSize = (equipType == 1 ? 40.0 : 28.0 );
    double fontSize = (equipType == 1 ? 10.0 : 8.0 );
    Widget nameText;
    if(equipType == 1){
      nameText = FittedBox(
        fit: BoxFit.contain,
        child: Text(equipMentData['name'], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: fontSize))
      );
    } else {
      List nameArray = equipMentData['name'].split(' ');
      List<Widget> nameTextChilds = [];
      for(int index = 0; index < nameArray.length; index++){
        nameTextChilds.add(
          FittedBox(
            fit: BoxFit.contain,
            child: Text(nameArray[index], style: TextStyle(color: Color(0xFFFFFFFF), fontSize: fontSize))
          )
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
  Widget equipMentSecondUtil(Map equipMentData, int secondNum) {
    double secondWidth = 180.0 / secondNum;
    List<Widget> thirdLine = [];
    if(equipMentData['materialList']!= null && equipMentData['materialList'].length > 0){
      for(int index = 0; index < equipMentData['materialList'].length; index++){
        // 三级分支
        thirdLine.add(
          Container(
            margin: EdgeInsets.only(left: 6.0, right: 6.0),
            child: equipMentUtil(equipMentData['materialList'][index], 2, equipMentData['materialList'].length),
          )
        );
      }
    }

    if(thirdLine.length > 0){
      return Container(
        height: 175,
        child: Column(
          children: <Widget>[
            Container(
              width: secondWidth,
              height: 60.0,
              child: equipMentUtil(equipMentData, 1, 1),
            ),
            equipMentLine(44, thirdLine.length),
            Container(
              height: 90.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: thirdLine,
              ),
            )
          ],
        )
      );
    } else {
      return Container(
        width: secondWidth,
        height: 175.0,
        child: equipMentUtil(equipMentData, 1, 1),
      );
    }
  }

  // 装备连线
  Widget equipMentLine(double totalWidth,int equipmentNum){
    double wTotalWidth = totalWidth * equipmentNum / 3;
    List<Widget> lineArray = [];
    lineArray.add(
      Positioned(
        top: 0.0,
        right: wTotalWidth / 2,
        child: Text('|', style: TextStyle(color: Color(0xFF4B4E51), fontSize: 10.0))
      )
    );
    if(equipmentNum > 1){
      lineArray.add(
        Positioned(
          top: 5.0,
          left: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: wTotalWidth,
                height: 8.0,
                child: Divider(
                  height: 8.0,
                  color: Color(0xFF4B4E51),
                ),
              )
            ],
          ),
        ),
      );
      lineArray.add(Positioned(
        top: 7.0,
        left: 0,
        child: Text('|', style: TextStyle(color: Color(0xFF4B4E51), fontSize: 10.0))
      ));
      lineArray.add(Positioned(
        top: 7.0,
        right: 0,
        child: Text('|', style: TextStyle(color: Color(0xFF4B4E51), fontSize: 10.0))
      ));
    }

    return Container(
      width: wTotalWidth,
      height: 22.0,
      child: Stack(
        children: lineArray,
      )
    );
  }

  Widget buildTreeList() {
    List<Widget> tiles = [];
    Widget content;
    tiles.add(
      Container(
        height: 60.0,
        child: equipMentUtil(_curEquipment, 1, 3)
      )
    );

    tiles.add(
      equipMentLine(170.0, _materialList.length)
    );

    if(_materialList!= null){
      List<Widget> lineSecond = [];
      for(var index = 0; index < _materialList.length; index++){
        // 第二层
        lineSecond.add(
          equipMentSecondUtil(_materialList[index], _materialList.length)
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
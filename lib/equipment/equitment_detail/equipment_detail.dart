import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'equitment_detail_top.dart';
import 'equipment_detail_desc.dart';
import 'equipment_detail_tree.dart';

class EquipmentDetail extends StatefulWidget {
  EquipmentDetail({Key key, this.equipmentId}): super(key: key);
  final int equipmentId;
  @override
  _EquipmentDetailState createState() => _EquipmentDetailState();
}

class _EquipmentDetailState extends State<EquipmentDetail> {
  int _equipmentId;
  Map _equipmentData;

  void initState(){
    this._equipmentId = super.widget.equipmentId;
    getEquipmentData();
    super.initState();
  }

  Future getEquipmentData() async {
    if(_equipmentData!= null && _equipmentData['data']!= null){ return; }
    final response = await http.get('https://dynamic-test.lulubox.com/ml/trunk/queryEquipById?equipId=$_equipmentId');
    if (response.statusCode == 200) {
      setState(() {
        _equipmentData = json.decode(response.body);
        print(_equipmentId);
        // print(_equipmentData);
      });
    } else {
      throw Exception('Failed to load getCardListData');
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_equipmentData!= null && _equipmentData['code'] == 0 && _equipmentData['data']!= null){
      return Container(
        margin: EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFF2D2F33),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 20.0,
          ),
          child:ListView(
            children: <Widget>[
              EquipmentDetailTop(equipmentData: _equipmentData['data']),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: Color(0xFF25272A),
                  height: 6.0,
                ),
              ),
              EquipmentDetailDesc(equipmentData: _equipmentData['data']),
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  color: Color(0xFF25272A),
                  height: 6.0,
                ),
              ),
              EquipmentDetailTree(equipmentData: _equipmentData['data'])
            ],
          ),
        )
      );
    } else {
      return  Container(
        margin: EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Color(0xFF2D2F33),
        ),
        child: Center(
          child:  CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
          ),
        ),
      );
    }
  }
}
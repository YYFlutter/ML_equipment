import 'package:flutter/material.dart';
import 'equitment_detail/equipment_detail.dart';

void main() => runApp(MaterialApp(
      home: EquipmentPageView(),
    ));

class EquipmentPageView extends StatefulWidget {
  EquipmentPageView({Key key, this.eqid, this.eqids}): super(key: key);
  final int eqid;
  final List eqids;
  @override
  _EquipmentPageViewState createState() => _EquipmentPageViewState();
}

class _EquipmentPageViewState extends State<EquipmentPageView> {
  List _equipmentList;
  int _equipmentID;
  @override
  void initState(){
    this._equipmentList = super.widget.eqids;
    this._equipmentID = super.widget.eqid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(
        viewportFraction: 0.8,
        initialPage: _equipmentList.indexOf(_equipmentID)
      ),
      itemBuilder: (context, position) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 10.0,
          ),
          child: EquipmentDetail(equipmentId: _equipmentList[position])
        );
      },
      itemCount: _equipmentList.length,
    );
  }
}
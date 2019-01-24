import 'package:flutter/material.dart';
import 'equitment_detail/equipment_detail.dart';

void main() => runApp(MaterialApp(
      home: EquipmentPageView(),
    ));

class EquipmentPageView extends StatefulWidget {
  @override
  _EquipmentPageViewState createState() => _EquipmentPageViewState();
}

class _EquipmentPageViewState extends State<EquipmentPageView> {
  final List _equipmentList = [3110, 3206, 3201, 3202];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
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
import 'package:flutter/material.dart';
import 'equipment_detail.dart';

void main() => runApp(MaterialApp(
      home: EquipmentPageView(),
    ));

class EquipmentPageView extends StatefulWidget {
  @override
  _EquipmentPageViewState createState() => _EquipmentPageViewState();
}

class _EquipmentPageViewState extends State<EquipmentPageView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, position) {
        return EquipmentDetail();
      },
      itemCount: 10,
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: EquipmentDialog(),
    ));

class EquipmentDialog extends StatefulWidget {
  @override
  _EquipmentDialogState createState() => _EquipmentDialogState();
}

class _EquipmentDialogState extends State<EquipmentDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF2D2F33),
          ),
      );
  }
}
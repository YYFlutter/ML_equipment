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
    return SimpleDialog(
        title: const Text('Select assignment'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () { print('a1'); },
            child: const Text('Treasury department'),
          ),
          SimpleDialogOption(
            onPressed: () { print('a2'); },
            child: const Text('State department'),
          ),
        ],
      );
  }
}
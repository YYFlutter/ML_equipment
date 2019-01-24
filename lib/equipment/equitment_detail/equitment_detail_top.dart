import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: EquipmentDetailTop(),
    ));

class EquipmentDetailTop extends StatefulWidget {
  EquipmentDetailTop({Key key, this.equipmentData}): super(key: key);
  final Map equipmentData;
  @override
  _EquipmentDetailTopState createState() => _EquipmentDetailTopState();
}

class _EquipmentDetailTopState extends State<EquipmentDetailTop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 0.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Image.network(super.widget.equipmentData['image'],width: 44.0, height: 44.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 105.0,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          super.widget.equipmentData['name'], 
                          style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15.0),
                          overflow: TextOverflow.ellipsis
                        )
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      padding: const EdgeInsets.all(2.0),
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFFFF5F49)),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Text(super.widget.equipmentData['category'], style: TextStyle(color: Color(0xFFFF5F49), fontSize: 10.0)),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Opacity(
                    opacity: 0.6,
                    child: Text('Price:', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12.0)),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Text(super.widget.equipmentData['cost'].toString(), style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12.0)),
                  )
                ]
              ),
            ],
          )
        ]
      )
    );
  }
}
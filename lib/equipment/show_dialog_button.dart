import 'package:flutter/material.dart';
import 'modalroute.dart';

class ShowDialogButton extends StatefulWidget {
  @override
  _ShowDialogButtonState createState() => _ShowDialogButtonState();
}

class _ShowDialogButtonState extends State<ShowDialogButton> {
  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay(
      eqid: 1401,
      eqids: [1001, 1002, 1003, 1004, 1005, 1006, 1101, 1102, 1103, 1104, 1105, 1106, 1201, 1202, 1203, 1204, 1205, 1301, 1401, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2101, 2102, 2103, 2104, 2105, 2106, 2107, 2108, 2109, 2110, 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2301, 2302, 2303, 2304, 2305, 2306, 2307, 2308, 2401, 2402, 2403, 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009, 3010, 3012, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3110, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3401, 3402, 3403]
    ));
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //padding
      child: new Text(
        'test dialog'
      ),
      onPressed: () => _showOverlay(context)
    );
  }
}
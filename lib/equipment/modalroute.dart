import 'package:flutter/material.dart';
import 'pageview.dart';

class TutorialOverlay extends ModalRoute<void> {
  TutorialOverlay({Key key, this.eqid, this.eqids});
  final int eqid;
  final List eqids;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.2);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
        print(eqid);
        print(eqids);
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150.0,
              child: EquipmentPageView(eqid: eqid, eqids: eqids),
            ),
            ButtonTheme(
              minWidth: 50.0,
              child: RaisedButton(
                color: Color(0xFF2a2e30),
                child: Opacity(
                  opacity: 0.6,
                  child: Icon(Icons.close, color: Color(0xFFFFFFFF)),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            )
          ]
        )
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
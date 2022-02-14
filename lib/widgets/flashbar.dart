import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

custom(BuildContext context, String textt) {
  Flushbar flushbar;
  flushbar = Flushbar(
    padding: EdgeInsets.only(top: 20, bottom: 20),
    title: 'Attention',
    message: textt,
    duration: Duration(seconds: 30),
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.GROUNDED,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticInOut,
    backgroundColor: Colors.red,
    boxShadows: [
      BoxShadow(
        color: Colors.red[800],
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      ),
    ],
    backgroundGradient: LinearGradient(
      // colors: [Colors.blueGrey, Colors.green],
      colors: [Colors.red.withOpacity(1), Colors.redAccent.withOpacity(0.6)],
    ),
    isDismissible: false,
    icon: Image.asset('assets/images/warn.png'),
    //size: 20,
    // Icons.add_alert,
    // color: Colors.yellow,

    mainButton: FlatButton(
      onPressed: () {
        flushbar.dismiss();
      },
      child: Text(
        'DONE',
        style: TextStyle(color: Colors.white),
      ),
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.yellow[900],
    progressIndicatorValueColor:
        new AlwaysStoppedAnimation<Color>(Colors.red[700]),
  )..show(context);
}

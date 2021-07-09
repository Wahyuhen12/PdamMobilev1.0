import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppPresentaseHold extends StatelessWidget {
  const AppPresentaseHold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CircularPercentIndicator(
        radius: 37.0,
      lineWidth: 4.0,
      percent: 0.60,
      center: new Text("60%",
      style: TextStyle(fontSize: 12.0),
      ),
      progressColor: Colors.green,
    );
  }
}

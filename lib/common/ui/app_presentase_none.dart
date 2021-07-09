import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppPresentaseNone extends StatelessWidget {
  const AppPresentaseNone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new CircularPercentIndicator(
       radius: 37.0,
      lineWidth: 4.0,
      percent: 0.00,
      center: new Text("0%"),
      progressColor: Colors.grey,
    );
  }
}

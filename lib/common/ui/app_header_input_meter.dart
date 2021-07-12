import 'package:flutter/material.dart';

class HeaderInputMeter extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const HeaderInputMeter({Key key, this.onTap, this.child}) : super(key: key);
  @override
  _HeaderInputMeterState createState() => _HeaderInputMeterState();
}

class _HeaderInputMeterState extends State<HeaderInputMeter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: widget.child,
    );
  }
}

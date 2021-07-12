import 'package:flutter/material.dart';

class ButtonSend extends StatefulWidget {
  final VoidCallback onTap;

  const ButtonSend({Key key, this.onTap}) : super(key: key);
  @override
  _ButtonSendState createState() => _ButtonSendState();
}

class _ButtonSendState extends State<ButtonSend> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            "Kirim Data",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

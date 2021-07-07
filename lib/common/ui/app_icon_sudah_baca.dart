import 'package:flutter/material.dart';

class AppIconSudahBaca extends StatelessWidget {
  const AppIconSudahBaca({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.green[100],
      child: Icon(
        Icons.check,
        color: Colors.green[300],
      ),
    );
  }
}
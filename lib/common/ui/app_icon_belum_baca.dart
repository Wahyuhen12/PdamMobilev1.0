import 'package:flutter/material.dart';

class AppIconBelumBaca extends StatelessWidget {
  const AppIconBelumBaca({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red[100],
      child: Icon(
        Icons.do_disturb_on,
        color: Colors.red[300],
      ),
    );
  }
}
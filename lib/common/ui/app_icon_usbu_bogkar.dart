import 'package:flutter/material.dart';

class AppIconUsbuBongkar extends StatelessWidget {
  const AppIconUsbuBongkar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Icon(Icons.carpenter),
            Text(
              "Bongkar",
              style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppIconUsbuPutus extends StatelessWidget {
  const AppIconUsbuPutus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Icon(Icons.mic_external_off),
            Text(
              "Putus",
              style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

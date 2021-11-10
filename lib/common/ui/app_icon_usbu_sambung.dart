import 'package:flutter/material.dart';

class AppIconUsbuSambung extends StatelessWidget {
  const AppIconUsbuSambung({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.green,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Icon(Icons.mic_external_on),
            Text(
              "Sambung",
              style: TextStyle(fontSize: 8.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

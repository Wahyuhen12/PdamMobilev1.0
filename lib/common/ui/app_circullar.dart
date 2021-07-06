import 'dart:async';

import 'package:flutter/material.dart';

class AppCircullar extends StatefulWidget {
  const AppCircullar({ Key key }) : super(key: key);

  @override
  _AppCircullarState createState() => _AppCircullarState();
}

class _AppCircullarState extends State<AppCircullar> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 150.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Check Connection",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: "Sofia",
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w700,
                      color: Colors.orangeAccent),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    "Please waiting 4 second",
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Sofia",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Align(
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                        backgroundColor: Colors.black12,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          );
  }
}
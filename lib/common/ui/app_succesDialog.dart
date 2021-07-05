import 'package:flutter/material.dart';

class AppSuccesDialog extends StatefulWidget {
  const AppSuccesDialog({ Key key }) : super(key: key);

  @override
  _AppSuccesDialogState createState() => _AppSuccesDialogState();
}

class _AppSuccesDialogState extends State<AppSuccesDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: InkWell(
        onTap: ()=>Navigator.of(context).pushNamed('/dashboardView'),
        child: Container(
          width: 160,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  color: Colors.lightGreen[500],
                  child: Column(
                    children: <Widget>[
                      Container(height: 10),
                      Icon(Icons.check_circle, color: Colors.white, size: 100),
                      Text("Succes",
                          style: TextStyle(
                              fontFamily: "Sofia",
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 25.0)),
                      Container(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
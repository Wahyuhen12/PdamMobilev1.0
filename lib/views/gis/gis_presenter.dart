import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

displayBottomSheet() {
  OneContext().showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      builder: (context) => SingleChildScrollView(
              child: Container(
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.maximize_rounded,
                  color: Colors.grey,
                  size: 35.0,
                ),
              ),
            ),
            Text(
              "Keterangan",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 29),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: [
                  Text("Nama Pemasang  :"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("")
                ],
              ),
            ),
          ]))));
}

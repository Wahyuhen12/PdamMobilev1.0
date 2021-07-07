import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_icon_camera.dart';
import 'package:mobile_pdam/common/ui/app_text_input_meter.dart';

class InputMeter extends StatefulWidget {
  @override
  _InputMeterState createState() => _InputMeterState();
}

class _InputMeterState extends State<InputMeter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "9999999",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  print(
                    "Haloo",
                  );
                },
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: IconCamera(
                    size: 40,
                  ),
                ),
              ),
              Container(
                child: TextInputMeter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

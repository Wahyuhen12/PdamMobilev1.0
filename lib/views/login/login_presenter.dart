import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_succesDialog.dart';
import 'package:mobile_pdam/utils/request.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginBasicPresenter{
  AppModel appModel = AppModel();

  void buttonClick(BuildContext context) async {
    String username = "eve.holt@reqres.in";
    String password = "cityslicka";

    final response = await Requests().posts("api/login", body: {
      "email":username,
      "password": password,
    });
    if(response.statusCode == 200){
      _showDialog(context);
    }
    print(response.body);
  }

  void _showDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AppSuccesDialog();
    },
  );
}
}

class AppModel {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  
  String result = "";
}

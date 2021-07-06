import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobile_pdam/utils/device_info.dart';

class ResponseApp {
  String code;
  String message;
  dynamic data;
}

class Requests {
  Map<String, String> _header = {};
  String apiUrl = "https://accounts.angondata.net/testgolang.html";
  int _timeout = 40;

  //Init header
  Requests() {
    _header["x-os"] = Platform.operatingSystemVersion;
    _header["Content-Type"] = "text/html";
    _header["User-Agent"] = "flutter agents";
  }

  //GET REQUEST
  Future<ResponseApp> get(String endpoint, {int timeout}) async {
    final Uri uri = Uri.parse(apiUrl);
    final timestamp = new DateTime.now().millisecondsSinceEpoch;
    final hwid = await DeviceInfo.gethardwareid();
    String errorCode;
    String errorMessage;
    String result;

    _header["x-timestamp"] = timestamp.toString();
    _header["x-hwid"] = hwid;
    _timeout = timeout == null ? _timeout : timeout;

    try {
      final response = await http
          .get(
            uri,
            headers: _header,
          )
          .timeout(new Duration(seconds: _timeout));

      if (response.statusCode == 200) {
        result = response.body;
      } else {
        errorCode = "HTTP-" + response.statusCode.toString();
        errorMessage = "Response error from server.";
      }
    } on TimeoutException {
      errorCode = "HTTP-TIMEOUT";
      errorMessage = "Response timeout from server.";
    } on SocketException {
      errorCode = "HTTP-NOCONNECT";
      errorMessage = "You are not connected to internet";
    }

    return _decodeResponse(errorCode, errorMessage, result);
  }

  //POST REQUEST
  Future<ResponseApp> post(String endpoint,
      {Map<String, dynamic> body, int timeout}) async {
    final Uri uri = Uri.parse(apiUrl);
    final timestamp = new DateTime.now().millisecondsSinceEpoch;
    final hwid = await DeviceInfo.gethardwareid();

    String errorCode;
    String errorMessage;
    String result;

    _header["x-timestamp"] = timestamp.toString();
    _header["x-hwid"] = hwid;
    _timeout = timeout == null ? _timeout : timeout;

    try {
      final response = await http
          .post(
            uri,
            headers: _header,
            body: jsonEncode(body),
          )
          .timeout(new Duration(seconds: _timeout));

      if (response.statusCode == 200) {
        result = response.body;
      } else {
        errorCode = "HTTP-" + response.statusCode.toString();
        errorMessage = "Response error from server.";
      }
    } on TimeoutException {
      errorCode = "HTTP-TIMEOUT";
      errorMessage = "Response timeout from server.";
    } on SocketException {
      errorCode = "HTTP-NOCONNECT";
      errorMessage = "You are not connected to internet";
    }

    return _decodeResponse(errorCode, errorMessage, result);
  }

  //Decode JSON Response
  ResponseApp _decodeResponse(
      String errorCode, String errorMessage, String databody) {
    final ResponseApp response = new ResponseApp();

    response.code = errorCode;
    response.message = errorMessage;

    if (errorCode != null) {
      return response;
    }

    dynamic result;
    try {
      result = json.decode(databody);
    } on FormatException catch (_) {
      response.code = "HTTP-DECODE";
      response.message = "Error decode response from server";
      return response;
    }

    final status = result["status"];
    final data = result["data"];

    if (status == null) {
      response.code = "HTTP-DECODE";
      response.message = "Error format response from server";
      return response;
    }

    if (status["code"] != "0000") {
      response.code = status["code"];
      response.message = status["message"];
      return response;
    }

    response.code = status["code"];
    response.message = status["message"];
    response.data = data;
    return response;
  }
}

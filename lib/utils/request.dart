import 'dart:convert';
import 'dart:io';
import 'package:mobile_pdam/utils/encryption.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mobile_pdam/utils/device_info.dart';

// Request merupakan class yang menghandler segala request ke server
class Requests {
  Map<String, String> _defaultHeaders = {};

  String url = "https://reqres.in/";

  // init setting defalut header
  Requests() {
    _defaultHeaders["x-app"] = "11111111";
    _defaultHeaders["x-os"] = Platform.operatingSystemVersion;
    _defaultHeaders["x-timestamp"] = "";
    _defaultHeaders["x-signature"] = "";
  }

  /// get method yang berfungsi untuk membuat request GET ke server berdasarkan
  /// endpoint. queryParam merupakan data yang dikirim saat request
  /// contoh:
  ///
  /// var httpReq = Requests();
  /// var result = await httpReq.get("/units", queryParams:{"unit": 1})
  Future<http.Response> get(
    String endpoint, {
    Map<String, String> headers,
    Map<String, dynamic> queryParams,
  }) {
    var headerSend = {};
    headerSend.addAll(_defaultHeaders);
    if (headers.isNotEmpty) {
      headerSend.addAll(headers);
    }

    return http.get(
      Uri.http(url, endpoint, queryParams),
      headers: headerSend,
    );
  }

  /// method post berfungsi untuk membuat request POST ke server berdasarkan endpoint
  /// contoh:
  ///
  /// var result = await Request().post("/auth", body:{"user_name": "admin"})
  Future<http.Response> post(
    String endpoint, {
    Map<String, String> headers,
    Map<String, dynamic> body,
  }) async {

    String apiUrl = "https://reqres.in/api/login"; 

    // melakukan pengecekan untuk mengkonfirmasi apakah ada tambahan header
    var headerSend = {};
    headerSend.addAll(_defaultHeaders);
    var timestamp = new DateTime.now().millisecondsSinceEpoch;
    var hwid = await DeviceInfo.gethardwareid();

    if (hwid == "") {
      _defaultHeaders["x-timestamp"] = timestamp.toString();
    } else {
      var signature = Encrypt.hmac256Encryption(
          data: (json.encode(body) + "$timestamp"), key: hwid);
      _defaultHeaders["x-timestamp"] = timestamp.toString();
      _defaultHeaders["x-signature"] = "$signature";
    }
    // final response = await http.post(
    //   Uri.http(GlobalVar.serverIP, endpoint),
    //   body: data,
    //  headers: headerSend,
    // );
    
    final response = await http.post(Uri.http(apiUrl, endpoint),
          body: jsonEncode(body),
          // headers: _defaultHeaders
          headers: {
          "Content-Type": "application/json",
        },
    );
    return response;


  }

   Future<http.Response> posts(String endpoint,{
    Map<String, dynamic> body,
  }) async{
      String apiUrl = "https://reqres.in/"; 
      final response2 = await http.post(Uri.parse(apiUrl + endpoint),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
    );
    
    return response2;
   }
}

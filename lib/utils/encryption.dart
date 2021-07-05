import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Class encrypt digunakan untuk mengenkripsi data menggunakan sha1 dan hmac256
class Encrypt {
  /// contoh:
  /// 
  /// var signature = Encrypt.sha1Encryption("test");
  static String sha1Encryption(String data) {
    var encode = utf8.encode(data);
    var sha1Encrypted = sha1.convert(encode); //sha1 encryption
    return "$sha1Encrypted";
  }

  /// contoh:
  /// 
  /// var signature = Encrypt.hmac256Encryption(data: ""), key: "");
  static String hmac256Encryption({String key, String data}) {
    var encodeKey = utf8.encode(key); // data being hashed
    var hmac = Hmac(sha256, encodeKey);
    var hmac256Encrypt = hmac.convert(utf8.encode(data));
    return "$hmac256Encrypt";
  }
}

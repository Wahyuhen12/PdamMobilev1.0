import 'package:device_info/device_info.dart';

class DeviceInfo {
  static DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  /// Fungsi yang digunakan untuk get hardware id menggunakan device info
  /// Dari Smarthphone masing"
  static Future<String> gethardwareid() async {
    var build = await deviceInfoPlugin.androidInfo;
    return build.androidId;
  }

    /// Fungsi yang digunakan untuk get versi OS
    /// Dari smarthphone masing"
  static Future<String> getversios() async {
    var build = await deviceInfoPlugin.androidInfo;
    return build.version.baseOS;
  }

  
}

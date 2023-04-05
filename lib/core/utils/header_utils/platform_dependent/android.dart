import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:flutter_starter/data/dependency_injection/environment.dart';
import 'package:flutter_starter/data/provider/local/contract.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'contract.dart';

@Singleton(as: HeaderUtilsPD, env: <String>[Env.androidProduction, Env.androidStaging])
class AndroidHeaderUtils implements HeaderUtilsPD {
  final AndroidDeviceInfo? _androidDeviceInfo;
  final Database _database;
  final String _buildNumber;
  final String _advertisementId;

  AndroidHeaderUtils(
      this._androidDeviceInfo, this._database, this._buildNumber, this._advertisementId);

  @factoryMethod
  static Future<AndroidHeaderUtils> init(Database database) async {
    String _buildNumber = "";
    String _advertisementId = "";
    AndroidDeviceInfo? _androidDeviceInfo;
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _buildNumber = packageInfo.buildNumber;
    } catch (exception, stacktrace) {
      CustomPrint.printException(
          "AndroidHeaderUtils PackageInfo", exception.toString(), stacktrace.toString());
    }
    try {
      _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    } catch (exception, stacktrace) {
      CustomPrint.printException(
          "AndroidHeaderUtils DeviceInfoPlugin", exception.toString(), stacktrace.toString());
    }
    return AndroidHeaderUtils(_androidDeviceInfo, database, _buildNumber, _advertisementId);
  }

  @override
  String get advId => _advertisementId;

  @override
  String get appVersion => _buildNumber;

  @override
  String get deviceId =>
      // _androidDeviceInfo != null && _androidDeviceInfo!.androidId != null ? _androidDeviceInfo!.androidId! : "";
      _androidDeviceInfo != null && _androidDeviceInfo!.id != null ? _androidDeviceInfo!.id! : "";

  @override
  String get deviceName => _androidDeviceInfo != null && _androidDeviceInfo!.model != null
      ? _androidDeviceInfo!.model!
      : "";


  @override
  String get handsetMake => _androidDeviceInfo != null && _androidDeviceInfo!.manufacturer != null
      ? _androidDeviceInfo!.manufacturer!
      : "";

  @override
  String get handsetModel => _androidDeviceInfo != null && _androidDeviceInfo!.model != null
      ? _androidDeviceInfo!.model!
      : "";

  @override
  String get platform => "ANDROID";


  @override
  String get isMobileApp => "YES";

  @override
  String get reqMedium => "APP";
}

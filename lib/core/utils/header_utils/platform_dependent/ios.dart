import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:flutter_starter/data/dependency_injection/environment.dart';
import 'package:flutter_starter/data/provider/local/contract.dart';
import 'package:injectable/injectable.dart';
import 'contract.dart';

@Singleton(as: HeaderUtilsPD, env: <String>[Env.iosProduction, Env.iosStaging])
class IosHeaderUtils implements HeaderUtilsPD {
  final Database _database;

  IosHeaderUtils(this._database);

  @factoryMethod
  static Future<IosHeaderUtils> init(Database database) async {
    IosDeviceInfo _iosDeviceInfo;
    try {
      _iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      return IosHeaderUtils(database);
    } catch (exception, stacktrace) {
      CustomPrint.printException("ios info", exception.toString(), stacktrace.toString());
      return IosHeaderUtils(database);
    }
  }

  @override
  // TODO: implement advId
  String get advId => "";

  @override
  // TODO: implement appVersion
  String get appVersion => "";

  @override
  // TODO: implement deviceId
  String get deviceId => "";

  @override
  // TODO: implement deviceName
  String get deviceName => "";

  @override
  // TODO: implement handsetMake
  String get handsetMake => "";

  @override
  // TODO: implement handsetModel
  String get handsetModel => "";

  @override
  String get platform => "IOS";

  @override
  String get isMobileApp => "YES";

  @override
  String get reqMedium => "APP";
}

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:flutter_starter/core/utils/header_utils/platform_dependent/contract.dart';
import 'package:flutter_starter/data/dependency_injection/environment.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: HeaderUtilsPD, env: <String>[Env.webProduction, Env.webStaging])
class WebHeaderUtils implements HeaderUtilsPD {
  final WebBrowserInfo _webBrowserInfo;

  WebHeaderUtils(this._webBrowserInfo);

  @factoryMethod
  static Future<WebHeaderUtils> init() async {
    WebBrowserInfo webBrowserInfo;
    try {
      webBrowserInfo = await DeviceInfoPlugin().webBrowserInfo;
      return WebHeaderUtils(webBrowserInfo);
    } catch (exception, stacktrace) {
      CustomPrint.printException("web browser info", exception.toString(), stacktrace.toString());
      return WebHeaderUtils(WebBrowserInfo(
          language: "",
          appCodeName: "",
          appName: "",
          appVersion: "",
          deviceMemory: 0,
          hardwareConcurrency: 0,
          languages: <String>[],
          maxTouchPoints: 0,
          platform: "",
          product: "",
          productSub: "",
          userAgent: "",
          vendor: "",
          vendorSub: ""));
    }
  }

  @override
  String get advId => "";

  @override
  //TODO: pick version from pubs later
  String get appVersion => "";

  @override
  String get deviceId {
    try {
      return _webBrowserInfo.appVersion ?? "";
    } catch (exception, stacktrace) {
      CustomPrint.printException("web browser info", exception.toString(), stacktrace.toString());
      return "";
    }
  }

  @override
  String get deviceName {
    try {
      return _webBrowserInfo.browserName.name;
    } catch (exception, stacktrace) {
      CustomPrint.printException("web browser info", exception.toString(), stacktrace.toString());
      return "";
    }
  }

  @override
  String get handsetMake {
    try {
      return _webBrowserInfo.platform ?? "";
    } catch (exception, stacktrace) {
      CustomPrint.printException("web browser info", exception.toString(), stacktrace.toString());
      return "";
    }
  }

  @override
  String get handsetModel {
    try {
      return "${_webBrowserInfo.product ?? ""}   ${_webBrowserInfo.productSub ?? ""}";
    } catch (exception, stacktrace) {
      CustomPrint.printException("web browser info", exception.toString(), stacktrace.toString());
      return "";
    }
  }

  @override
  String get platform => "";

  @override
  String get reqMedium => "WEB";

  @override
  String get isMobileApp => "NO";
}

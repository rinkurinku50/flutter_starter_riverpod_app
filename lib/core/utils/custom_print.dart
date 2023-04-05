// @dart = 2.16
import 'package:flutter/foundation.dart';

class CustomPrint {
  static void customPrint(String value, {bool forcePrint = false}) {
    if (forcePrint) {
      print(value);
      return;
    }
    if (kDebugMode) print(value);
  }

  static void printException(String title, String exception, String stacktrace, {bool forcePrint = false}) {
    customPrint(title, forcePrint: forcePrint);
    customPrint("exception " + exception.toString(), forcePrint: forcePrint);
    customPrint("stacktrace " + stacktrace.toString(), forcePrint: forcePrint);
  }
}

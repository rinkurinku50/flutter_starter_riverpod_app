
import 'package:connectivity_plus/connectivity_plus.dart';

import 'custom_print.dart';

class ConnectionStatus {
  static Future<bool> connectionAvailable() async {
    try {
      final ConnectivityResult result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      }
      return true;
    } catch (exception, stacktrace) {
      CustomPrint.printException("connectivity", exception.toString(), stacktrace.toString());
      return true;
    }
  }
}

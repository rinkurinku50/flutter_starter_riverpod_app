import 'package:flutter/foundation.dart';
import 'package:flutter_starter/core/utils/header_utils/platform_dependent/contract.dart';
import 'package:flutter_starter/core/utils/header_utils/platform_independent/contract.dart';
import 'package:flutter_starter/data/provider/local/contract.dart';
import 'package:flutter_starter/data/provider/local/model/db_keys.dart';
import 'package:flutter_starter/data/provider/network/models/api_result.dart';
import 'package:flutter_starter/data/provider/network/models/network_exception.dart';
import 'package:flutter_starter/data/provider/network/models/network_method.dart';
import 'package:flutter_starter/data/provider/network/models/network_parameter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'http_contract.dart';

@Singleton(as: HttpNetwork)
class HttpNetworkImplementation implements HttpNetwork {
  final HeaderUtilsPI _headerUtilsPI;
  final HeaderUtilsPD _headerUtilsPD;
  final Database _database;

  HttpNetworkImplementation(this._headerUtilsPI, this._headerUtilsPD, this._database);

  @override
  Future<http.Response> getResponse({required NetworkMethod method}) async {
    try {
      return await method.when(post: (NetworkParameter method) async {
        http.Response response = await http.post(Uri.parse(method.url), body: method.requestBody, headers: {
          ...getHeaders(),
          ...?method.headers,
          ...{'Content-Type': 'application/json; charset=UTF-8'}
        }).timeout(Duration(minutes: 3));
        storeResponseHeaders(response.headers);
        return response;
      }, get: (NetworkParameter method) async {
        http.Response response = await http
            .get(Uri.parse(method.url), headers: {...getHeaders(), ...?method.headers}).timeout(Duration(minutes: 3));
        storeResponseHeaders(response.headers);
        return response;
      });
    } catch (exception, stacktrace) {
      if (kDebugMode) {
        print("file : http implementation");
        print(stacktrace);
      }
      rethrow;
    }
  }

  @override
  bool validStatusCode(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  @override
  ApiResult noConnectionException = const ApiResult.failure(networkException: NetworkException.noConnectionException());

  @override
  ApiResult unknownException = const ApiResult.failure(networkException: NetworkException.unknownException());

  ///common tasks for all api's
  Map<String, String> getHeaders() {
    return {
      "appVer": _headerUtilsPD.appVersion,
      "reqMedium": _headerUtilsPD.reqMedium,
      "deviceId": _headerUtilsPD.deviceId,
      "handsetMake": _headerUtilsPD.handsetMake,
      "handsetModel": _headerUtilsPD.handsetModel,
      "deviceName": _headerUtilsPD.deviceName,
      "isMobileApp": _headerUtilsPD.isMobileApp,
      "platform": _headerUtilsPD.platform,
      "advId": _headerUtilsPD.advId,
      "loginModule": _headerUtilsPI.loginModule,
      "token": _headerUtilsPI.token,
      "lang": _headerUtilsPI.language,
    };
  }

  storeResponseHeaders(Map<String, String> headers) {
    if (headers["token"] != null && headers["token"]!.trim().isNotEmpty) {
      _database.dbWrite(box: DbKeys.sessionTable, key: DbKeys.token, value: headers["token"]!);
    }
  }
}

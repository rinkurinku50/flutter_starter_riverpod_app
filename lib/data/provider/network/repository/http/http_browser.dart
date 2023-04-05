import 'package:flutter_starter/core/utils/connection_status.dart';
import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:flutter_starter/data/dependency_injection/environment.dart';
import 'package:flutter_starter/data/provider/network/contract.dart';
import 'package:flutter_starter/data/provider/network/models/api_result.dart';
import 'package:flutter_starter/data/provider/network/models/network_exception.dart';
import 'package:flutter_starter/data/provider/network/models/network_method.dart';
import 'package:flutter_starter/data/provider/network/repository/http/core/http_contract.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';


@Singleton(as: Network, env: <String>[Env.webStaging, Env.webProduction])
class HttpNetworkBrowser implements Network {
  final HttpNetwork _httpNetwork;

  HttpNetworkBrowser(this._httpNetwork);

  @override
  Future<ApiResult> callApi({required NetworkMethod method}) async {
    bool connection = await ConnectionStatus.connectionAvailable();
    if (!connection) {
      return _httpNetwork.noConnectionException;
    }
    try {
      http.Response _response = await _httpNetwork.getResponse(method: method);
      Map<String, String> _headers = _response.headers;
      String _body = _response.body;
      String _url = _response.request?.url.toString() ?? "";
      int _statusCode = _response.statusCode;
      if (_httpNetwork.validStatusCode(_response.statusCode)) {
        return ApiResult.success(data: _body, url: _url, headers: _headers, statusCode: _statusCode);
      } else {
        return ApiResult.error(data: _body, url: _url, headers: _headers, statusCode: _statusCode);
      }
    } on FormatException catch (exception, stacktrace) {
      CustomPrint.printException("format exception", exception.toString(), stacktrace.toString());
      return ApiResult.failure(networkException: NetworkException.formatException(exception: exception));
    } catch (exception, stacktrace) {
      CustomPrint.printException("unknown exception", exception.toString(), stacktrace.toString());
      return _httpNetwork.unknownException;
    }
  }
}

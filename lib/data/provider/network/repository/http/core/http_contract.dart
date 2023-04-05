import 'package:flutter_starter/data/provider/network/models/api_result.dart';
import 'package:flutter_starter/data/provider/network/models/network_method.dart';
import 'package:http/http.dart' as http;


abstract class HttpNetwork {
  Future<http.Response> getResponse({required NetworkMethod method});

  bool validStatusCode(int statusCode);

  late ApiResult unknownException;
  late ApiResult noConnectionException;
}

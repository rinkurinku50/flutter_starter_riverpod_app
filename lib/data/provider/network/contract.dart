import 'package:flutter_starter/data/provider/network/models/api_result.dart';
import 'package:flutter_starter/data/provider/network/models/network_method.dart';

abstract class Network {
  Future<ApiResult> callApi({required NetworkMethod method});
}

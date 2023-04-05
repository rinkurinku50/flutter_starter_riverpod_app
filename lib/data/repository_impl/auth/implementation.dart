import 'package:flutter_starter/core/utils/custom_print.dart';
import 'package:flutter_starter/data/models/auth_model/login/login_request.dart';
import 'package:flutter_starter/data/models/auth_model/signup/signup_request.dart';
import 'package:flutter_starter/data/provider/network/contract.dart';
import 'package:flutter_starter/data/provider/network/end_point_repository/auth_endpoints.dart';
import 'package:flutter_starter/data/provider/network/models/api_result.dart';
import 'package:flutter_starter/data/provider/network/models/network_exception.dart';
import 'package:flutter_starter/data/provider/network/models/network_method.dart';
import 'package:flutter_starter/data/provider/network/models/network_parameter.dart';
import 'package:flutter_starter/domain/repository/auth/contract.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final Network _network;
  final AuthEndPoints _authEndPoints;

  AuthRepoImpl(this._network, this._authEndPoints);

  @override
  Future<ApiResult> login(LoginRequest loginRequest) async {
    ApiResult result;
    try {
      result = await _network.callApi(
          method: NetworkMethod.post(
              networkParameter: NetworkParameter(
                  url: _authEndPoints.loginUrl, requestBody: loginRequestToJson(loginRequest))));
    } catch (exception, stacktrace) {
      CustomPrint.printException(
          "Auth repo error SignIn", exception.toString(), stacktrace.toString());
      result = const ApiResult.failure(networkException: NetworkException.unknownException());
    }
    return result;
  }

  @override
  Future<ApiResult> signup(SignupRequest signupRequest) async {
    ApiResult result;
    try {
      result = await _network.callApi(
          method: NetworkMethod.post(
              networkParameter: NetworkParameter(
                  url: _authEndPoints.signUp, requestBody: signupRequestToJson(signupRequest))));
    } catch (exception, stacktrace) {
      CustomPrint.printException(
          "Auth repo error SignUp", exception.toString(), stacktrace.toString());
      result = const ApiResult.failure(networkException: NetworkException.unknownException());
    }
    return result;
  }
}

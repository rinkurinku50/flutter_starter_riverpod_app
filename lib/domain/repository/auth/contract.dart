import 'package:flutter_starter/data/models/auth_model/login/login_request.dart';
import 'package:flutter_starter/data/models/auth_model/signup/signup_request.dart';
import 'package:flutter_starter/data/provider/network/models/api_result.dart';

abstract class AuthRepo {
  Future<ApiResult> login(LoginRequest loginRequest);

  Future<ApiResult> signup(SignupRequest signupRequest);
}

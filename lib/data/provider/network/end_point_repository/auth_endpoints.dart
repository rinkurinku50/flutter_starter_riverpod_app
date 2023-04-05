import 'package:flutter_starter/data/provider/network/end_point_constants/auth_endpoints_constants.dart';
import 'package:flutter_starter/data/provider/network/end_point_repository/end_points.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthEndPoints {
  EndPoints endPoints;

  AuthEndPoints(this.endPoints);

  String get loginUrl => endPoints.finalUrl(endPoint: AuthEndPointConstants.login);

  String get signUp => endPoints.finalUrl(endPoint: AuthEndPointConstants.signUp);
}

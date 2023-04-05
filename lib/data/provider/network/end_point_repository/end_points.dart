import 'package:flutter_starter/data/dependency_injection/environment.dart';
import 'package:flutter_starter/data/provider/network/end_point_constants/end_point_constants.dart';
import 'package:injectable/injectable.dart';

abstract class EndPoints {
  String finalUrl({required String endPoint});

  String razerPay();
}

@Singleton(as: EndPoints, env: <String>[Env.androidStaging, Env.iosStaging, Env.webStaging])
class StagingEndpoint extends EndPoints {
  @override
  String finalUrl({required String endPoint}) {
    return EndPointConstants.baseStaging + endPoint;
  }

  @override
  String razerPay() {
    return "TEST";
  }
}

@Singleton(
    as: EndPoints, env: <String>[Env.androidProduction, Env.iosProduction, Env.webProduction])
class ProductionEndpoint extends EndPoints {
  @override
  String finalUrl({required String endPoint}) {
    return EndPointConstants.baseProduction + endPoint;
  }

  @override
  String razerPay() {
    return "PROD";
  }
}

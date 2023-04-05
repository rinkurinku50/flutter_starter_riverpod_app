import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exception.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult with _$ApiResult {
  const factory ApiResult.success(
      {required String data,
        required String url,
        required Map<String, String> headers,
        required int statusCode}) = _ApiResultSuccess;

  const factory ApiResult.error(
      {required String data,
        required String url,
        required Map<String, String> headers,
        required int statusCode}) = _ApiResultError;

  const factory ApiResult.failure({required NetworkException networkException}) = _ApiResultFailure;
}
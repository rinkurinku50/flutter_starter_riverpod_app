import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_parameter.freezed.dart';

@freezed
class NetworkParameter with _$NetworkParameter {
  const factory NetworkParameter(
      {required String url,
      String? requestBody,
      Map<String, String>? headers,
      Map<String, String>? queryParameters,
      File? file}) = _NetworkParameter;
}

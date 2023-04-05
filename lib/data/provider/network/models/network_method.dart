import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_parameter.dart';

part 'network_method.freezed.dart';

@freezed
class NetworkMethod with _$NetworkMethod {
  const factory NetworkMethod.post({required NetworkParameter networkParameter}) = _NetworkMethodPost;

  const factory NetworkMethod.get({required NetworkParameter networkParameter}) = _NetworkMethodGet;
}

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException {
  const factory NetworkException.noConnectionException() = _NoConnectionException;

  const factory NetworkException.timeoutException() = _TimeoutException;

  const factory NetworkException.unknownException() = _UnknownException;

  const factory NetworkException.httpException({required HttpException exception}) = _HttpException;

  const factory NetworkException.socketException({required SocketException exception}) = _SocketException;

  const factory NetworkException.formatException({required FormatException exception}) = _FormatException;
}

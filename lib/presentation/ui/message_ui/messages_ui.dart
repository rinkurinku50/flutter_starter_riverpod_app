
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_starter/core/constants/messages.dart';
import 'package:flutter_starter/data/provider/network/models/network_exception.dart';


class MessagesUi {
  static void showSnackBar({required String message}) {
    ///TODO: needs to be changed to native snackbar once Get is removed
    // Get.snackbar(null, message,
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: AppColors.white,
    //     duration: Duration(milliseconds: 5000),
    //     colorText: AppColors.failedState,
    //     margin: new EdgeInsets.only(left: 0, right: 0),
    //     borderColor: AppNewColors.colorF1FCFE,
    //     borderWidth: 0.5,
    //     borderRadius: 0.0);
  }

  static void handleApiError({required String data}) {
    // ApiError? apiError;
    // try {
    //   apiError = apiErrorFromJson(data);
    // } catch (exception) {}
    // if (apiError != null) {
    //   MessagesUi.showSnackBar(message: apiErrorFromJson(data).errorMsg);
    // }
    // try {
    //   MessagesUi.showSnackBar(message: data.toString());
    // } catch (exception) {
    //   MessagesUi.showSnackBar(message: Messages.someThingWentWrong);
    // }
  }

  static void handleNetworkException({required NetworkException networkException}) {
    networkException.when(noConnectionException: () {
      showSnackBar(message: Messages.noInternet);
    }, timeoutException: () {
      showSnackBar(message: Messages.serverTimeout);
    }, unknownException: () {
      showSnackBar(message: Messages.someThingWentWrong);
    }, httpException: (HttpException exception) {
      showSnackBar(message: exception.message);
    }, socketException: (SocketException exception) {
      showSnackBar(message: exception.message);
    }, formatException: (FormatException exception) {
      showSnackBar(message: exception.message);
    });
  }
}

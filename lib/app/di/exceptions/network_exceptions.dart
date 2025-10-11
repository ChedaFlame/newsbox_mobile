import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getG;
import '../../../features/screens/splash_screen.dart';
import '../../app_utils/common/transition_widget.dart';
import '../../app_utils/common/ui.dart';


String? emCtiD = "";
// final box = GetStorage();

abstract class NetworkExceptions {
  static String handleResponse(Response response) {
    int statusCode = response.statusCode ?? 0;
    switch (statusCode) {
      case 400: {
        if (response.data['ResponseMessage'] == null){
          getG.Get.showSnackbar(Ui.ErrorSnackBar(title:response.data['responseMessage'],message:response.data['errors'][0]));
          Navigator.of(getG.Get.context!).pop();
        }else{
          getG.Get.showSnackbar(Ui.ErrorSnackBar(title:response.data['ResponseMessage'],message:response.data['Errors'][0]));
          Navigator.of(getG.Get.context!).pop();
        }
        return "${response.data['ResponseMessage']}";
      }
      case 401:{
        if (response.statusMessage == "Unauthorized"){
         Navigator.pushReplacement(
            getG.Get.context!, CircularRevealOutRoute(
            builder: (context) =>  SplashScreen(),
          ),
          );
        }
        return "${response.statusMessage}";
      }
      case 403:
        return "${response.statusMessage}";
      case 404:
        return "Not found";
      case 409:
        return "Error due to a conflict";
      case 408:
        return "Connection request timeout";
      case 500:{
        return "Internal Server Error";
      }

      case 503:
        return "Service unavailable";
      case 504:
        return "Gateway Timeout , Retry";
      default:
        return "Received invalid status code";
    }
  }

  static String getDioException(error) {
    if (error is Exception) {
      try {
        var errorMessage = "";
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorMessage = "Request Cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorMessage = "Connection request timeout";
              break;
            case DioExceptionType.connectionError:
              errorMessage = "No internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              errorMessage = NetworkExceptions.handleResponse(error.response!);
              break;
            case DioExceptionType.sendTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioExceptionType.badCertificate:
              errorMessage = 'Connection to Server failed due to badCertificate';
              break;
            case DioExceptionType.unknown: {
              errorMessage = NetworkExceptions.handleResponse(error.response!);
              break;
             }

          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection";
        } else {
         // errorMessage = "Unexpected error occurred";
        }
        return errorMessage;
      } on FormatException {
        return "Unexpected error occurred";
      } catch (_) {
        return "Unexpected error occurred";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unable to process the data";
      } else {
        return "Unexpected error occurred";
      }
    }
  }



}



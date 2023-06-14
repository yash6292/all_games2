import 'dart:async';
import 'dart:developer';
import 'dart:io';


class AppException implements Exception {
  String message;
  String? tag;
  int errorCode;

  AppException({required this.message, required this.errorCode, this.tag});

  @override
  String toString() {
    return '{"message": "$message", "errorCode": $errorCode}';
  }

  static dynamic exceptionHandler(exception, [stackTrace]) {
    log('Exception Message ==> ${exception ?? 'no message'}');
    if (exception is AppException) {
      //Log.info(message: stackTrace ?? "No stack provided", tag: 'AppException');
      throw exception;
    } else if (exception is SocketException) {
      // Log.info(
      //     message: stackTrace ?? "No stack provided", tag: 'SocketException');
      throw AppException(message: "Internet not available.", errorCode: 101);
    } else if (exception is TimeoutException) {
      // Log.info(
      //     message: stackTrace ?? "No stack provided", tag: 'TimeoutException');

      throw AppException(message: "The request has timed out.", errorCode: 102);
    } else if (exception is HttpException) {
      // Log.info(
      //     message: stackTrace ?? "No stack provided", tag: 'HttpException');
      throw AppException(
          message: "Couldn't find the requested data", errorCode: 103);
    } else if (exception is FormatException) {
      // Log.info(
      //     message: stackTrace ?? "No stack provided", tag: 'FormatException');
      throw AppException(
          message: "Looks like our server is down for maintenance,",
          errorCode: 104);
    } else {
      // Log.info(
      //     message: stackTrace ?? "No stack provided", tag: 'Unknown Error');
      throw AppException(
          message: "Unable to communicate with the server at the moment.",
          errorCode: 105);
    }
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:market/data/error/error_object.dart';

ErrorObject getException(error) {
  if (error is Exception) {
    try {
      if (error is SocketException) {
        return const ErrorObject("SocketException");
      }
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return const ErrorObject("Request cancelled");
          case DioErrorType.connectTimeout:
            return const ErrorObject("Connection timeout exceeded");
          case DioErrorType.response:
            final status = error.response!.statusCode;
            final response = error.response!.data;
            final message =
                ((response is Map) ? (response["message"]) : null) ??
                    error.message;
            final detail =
                (response["details"] is Map) ? response["details"] : {};
            return ErrorObject(
              message,
              detail: detail,
              statusCode: status,
            );

          case DioErrorType.sendTimeout:
            return const ErrorObject("Request send timeout exeeded");

          case DioErrorType.receiveTimeout:
            return const ErrorObject("Request receive timeout");
          case DioErrorType.other:
            return const ErrorObject("Unexpected error occured");
        }
      }
    } catch (_) {
      return const ErrorObject("Unexpected error occured");
    }
  }
  return ErrorObject(error.toString());
}

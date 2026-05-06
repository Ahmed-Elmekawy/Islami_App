import 'package:dio/dio.dart';
import 'failures.dart';

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const NetworkFailure('Connection timeout, please try again.');
        case DioExceptionType.badResponse:
          return ServerFailure(_handleBadResponse(error.response));
        case DioExceptionType.cancel:
          return const UnknownFailure('Request was cancelled.');
        case DioExceptionType.connectionError:
          return const NetworkFailure('No internet connection.');
        default:
          return const UnknownFailure(
            'An unexpected networking error occurred.',
          );
      }
    } else {
      return UnknownFailure(error.toString());
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) return 'Server error, please try again.';
    switch (response.statusCode) {
      case 400:
        return 'Bad request. Please check your data.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Forbidden. You do not have permission.';
      case 404:
        return 'Not found. The resource does not exist.';
      case 500:
        return 'Internal server error. Please try again later.';
      default:
        return 'Server error: ${response.statusCode}';
    }
  }
}

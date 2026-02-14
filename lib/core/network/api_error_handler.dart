import 'package:freetalk/core/network/api_error_model.dart';

class ErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    return ApiErrorModel(
      message: error.toString(),
    );
  }
}
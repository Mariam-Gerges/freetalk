class ApiErrorHandler {
  final String errorMessage;
  ApiErrorHandler(this.errorMessage);
}

class ErrorHandler {
  static ApiErrorHandler handle(dynamic error) {
    return ApiErrorHandler(error.toString());
  }
}

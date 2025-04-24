import 'package:nagwa_books/resources/enums_manager.dart';

class ApiResponseModel {
  ApiResponseModel({
    required this.status,
    this.data,
    this.message = '',
    this.statusCode,
  });

  final ApiStatus status;
  final int? statusCode;
  final dynamic data;
  final String message;
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nagwa_books/resources/enums_manager.dart';
import 'package:nagwa_books/services/api/api_response_model.dart';
import 'package:nagwa_books/services/api/network_service.dart';
import 'package:nagwa_books/services/setup_dependency_injection.dart';
import 'package:nagwa_books/utils/app_utils/app_logs.dart';

abstract class ApiRequest {
  Future<ApiResponseModel> getRequest(String path, {Object? body, Map<String, dynamic>? queryParameters});
  Future<ApiResponseModel> postRequest(String path, {Object? body, Map<String, dynamic>? queryParameters});
  Future<ApiResponseModel> putRequest(String path, {Object? body, Map<String, dynamic>? queryParameters});
  Future<ApiResponseModel> deleteRequest(String path, {Object? body, Map<String, dynamic>? queryParameters});
}

class DioConsumer implements ApiRequest {
  final Dio _dio = sl<NetworkService>().dio;

  @override
  Future<ApiResponseModel> getRequest(String path, {Object? body, Map<String, dynamic>? queryParameters}) async {
    return _handleRequest(() => _dio.get(path, queryParameters: queryParameters));
  }

  @override
  Future<ApiResponseModel> postRequest(String path, {Object? body, Map<String, dynamic>? queryParameters}) async {
    return _handleRequest(() => _dio.post(path, queryParameters: queryParameters, data: body));
  }

  @override
  Future<ApiResponseModel> putRequest(String path, {Object? body, Map<String, dynamic>? queryParameters}) async {
    return _handleRequest(() => _dio.put(path, queryParameters: queryParameters, data: body));
  }

  @override
  Future<ApiResponseModel> deleteRequest(String path, {Object? body, Map<String, dynamic>? queryParameters}) async {
    return _handleRequest(() => _dio.delete(path, queryParameters: queryParameters, data: body));
  }

  Future<ApiResponseModel> _handleRequest(Future<Response> Function() request) async {
    try {
      final response = await request();
      return _handleResponse(response);
    } on SocketException catch (error) {
      return _handleSocketError(error);
    } on DioException catch (error) {
      return _handleDioError(error);
    } catch (error) {
      return _handleGeneralError(error);
    }
  }

  ApiResponseModel _handleResponse(Response<dynamic> response) {
    try {
      final data = response.data;
      final statusCode = response.statusCode ?? 500;

      if (statusCode >= 200 && statusCode < 300) {
        return ApiResponseModel(
          status: ApiStatus.success,
          data: data,
          message: 'Request successful',
          statusCode: statusCode,
        );
      } else {
        final message = data['message']?.toString() ?? 'Error occurred';
        return ApiResponseModel(
          status: ApiStatus.error,
          data: data,
          statusCode: statusCode,
          message: message,
        );
      }
    } catch (e) {
      AppLogs.errorLog(e.toString(), 'Response Parsing Error');
      return ApiResponseModel(
        status: ApiStatus.error,
        message: 'Invalid response format',
        statusCode: 500,
      );
    }
  }

  ApiResponseModel _handleDioError(DioException error) {
    final statusCode = error.response?.statusCode ?? 500;
    final data = error.response?.data;

    String message;
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Request timed out. Please try again.';
        break;
      case DioExceptionType.badResponse:
        message = data != null && data['message'] != null ? data['message'].toString() : 'Server error: $statusCode';
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled';
        break;
      default:
        message = 'Network error occurred';
    }

    if (error.type == DioExceptionType.connectionError) {
      return _handleSocketError(error);
    }

    return ApiResponseModel(
      status: ApiStatus.error,
      data: data,
      statusCode: statusCode,
      message: message,
    );
  }

  ApiResponseModel _handleSocketError(dynamic error) {
    AppLogs.errorLog(error.toString(), 'Socket Error');
    return ApiResponseModel(
      status: ApiStatus.error,
      message: 'No internet connection. Please check your network.',
      statusCode: 503,
    );
  }

  ApiResponseModel _handleGeneralError(dynamic error) {
    AppLogs.errorLog(error.toString(), 'General Error');
    return ApiResponseModel(
      status: ApiStatus.error,
      message: 'An unexpected error occurred.',
      statusCode: 500,
    );
  }
}

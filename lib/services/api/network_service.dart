import 'package:dio/dio.dart';
import 'package:nagwa_books/flavors.dart';
import 'package:nagwa_books/utils/app_utils/app_logs.dart';

class NetworkService {
  NetworkService._internal();

  factory NetworkService() => _instance;
  static final NetworkService _instance = NetworkService._internal();

  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: F.baseUrl, //  Base URL from the flavor configuration  (dev or prod)
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logRequest(options);
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logResponse(response);
          handler.next(response);
        },
        onError: (error, handler) {
          _logError(error);
          handler.next(error);
        },
      ),
    );

    return dio;
  }

  void _logRequest(RequestOptions options) {
    AppLogs.infoLog('=== Request Start ===', 'Request');
    AppLogs.infoLog(options.baseUrl, 'Base URL');
    AppLogs.infoLog(options.path, 'Endpoint');
    AppLogs.infoLog(options.headers.toString(), 'Headers');
    AppLogs.infoLog(options.data?.toString() ?? 'No Data', 'Data');
    AppLogs.infoLog(options.queryParameters.toString(), 'Query Parameters');
    AppLogs.infoLog('=== Request End ===', 'Request');
  }

  void _logResponse(Response response) {
    AppLogs.successLog('=== Response Start ===', 'Response');
    AppLogs.successLog(response.data.toString(), 'Response Data');
    AppLogs.successLog(response.statusCode.toString(), 'Status Code');
    AppLogs.successLog(response.statusMessage?.toString() ?? 'No Status Message', 'Status Message');
    AppLogs.successLog('=== Response End ===', 'Response');
  }

  void _logError(DioException error) {
    AppLogs.errorLog('=== Error Start ===', 'Dio Error');
    AppLogs.errorLog(error.type.toString(), 'Error Type');
    AppLogs.errorLog(error.requestOptions.path, 'Error Path');
    AppLogs.errorLog(error.message ?? 'No Message', 'Error Message');
    AppLogs.errorLog(error.response?.data?.toString() ?? 'No Response Data', 'Response Data');
    AppLogs.errorLog(error.response?.statusCode?.toString() ?? 'No Status Code', 'Status Code');
    AppLogs.errorLog(error.response?.statusMessage ?? 'No Status Message', 'Status Message');
    AppLogs.errorLog('=== Error End ===', 'Dio Error');
  }
}

import 'package:dio/dio.dart';

class ApiClient implements Interceptor {
  ApiClient({
    required String baseUrl,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        validateStatus: (status) {
          return status != null && status >= 200 && status < 300 ||
              status == 304;
        },
      ),
    )..interceptors.add(this);
  }

  late Dio _dio;

  Dio get dio => _dio;

  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    handler.next(exception);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

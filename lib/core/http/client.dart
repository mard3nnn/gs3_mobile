import 'package:dio/dio.dart';

import '../constants/url.dart';

abstract interface class HttpClient {
  Future<Response<T>> get<T>(
    String path, {
    String baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> post<T>(
    String path, {
    String baseUrl = UrlConstants.baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

class HttpClientImpl implements HttpClient {
  HttpClientImpl() : _client = Dio() {
    _client.interceptors.add(
      InterceptorsWrapper(onRequest: (
        RequestOptions options,
        RequestInterceptorHandler? handler,
      ) async {
        options.baseUrl = UrlConstants.baseUrl;

        handler?.next(options);
      }, onResponse: (
        Response<dynamic> response,
        ResponseInterceptorHandler? handler,
      ) {
        handler?.next(response);
      }, onError: (
        DioException error,
        ErrorInterceptorHandler? handler,
      ) {
        handler?.next(error);
      }),
    );
  }

  final Dio _client;

  @override
  Future<Response<T>> get<T>(
    String path, {
    String baseUrl = UrlConstants.baseUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _client.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    String baseUrl = UrlConstants.baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _client.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}

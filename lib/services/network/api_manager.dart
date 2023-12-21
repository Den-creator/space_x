import 'package:dio/dio.dart';
import 'package:space_x/common/app_config/app_config.dart';
import 'package:space_x/services/network/auth_interceptor.dart';

class ApiManager {
  static final shared = ApiManager._();
  ApiManager._() {
    _dio = Dio()
      ..options = BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {'content-type': 'application/json'},
        validateStatus: (_) => true,
      )
      ..interceptors.add(AuthInterceptor());
  }

  late final Dio _dio;

  Future<Response?> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response?> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response?> put(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      options: options,
    );

    return response;
  }

  Future<Response?> patch(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    final response = await _dio.patch(
      path,
      data: data,
      options: options,
    );

    return response;
  }

  Future<Response?> delete(
    String path, {
    Options? options,
  }) async {
    final response = await _dio.delete(
      path,
      options: options,
    );

    return response;
  }
}

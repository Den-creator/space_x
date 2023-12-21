import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/presentation/logic/app_cubit.dart';
import 'package:space_x/app/presentation/screens/app.dart';
import 'package:space_x/common/utils/utils.dart';
import 'package:space_x/services/token_manager.dart';

class AuthInterceptor extends QueuedInterceptor {
  // late final _dio = Dio(
  //   BaseOptions(
  //     baseUrl: AppConfig.baseUrl,
  //     headers: {'content-type': 'application/json'},
  //     validateStatus: (_) => true,
  //   ),
  // );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headers = options.headers;

    /// Authorization
    final accessToken = await TokenManager.getAccessToken();
    if (accessToken != null) {
      Utils.debugPrint(accessToken);
      headers.addAll({'authorization': 'Bearer $accessToken'});
    }

    super.onRequest(
      options.copyWith(headers: headers),
      handler,
    );
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final options = response.requestOptions;

    Utils.debugPrint('${options.method} - ${response.realUri}');
    if (options.data != null) Utils.debugPrint('data - ${options.data}');
    Utils.debugPrint('statusCode - ${response.statusCode}');

    if (response.statusCode != HttpStatus.unauthorized) {
      super.onResponse(response, handler);
      return;
    }

    // Try to refresh access token, using refresh one
    // final refreshToken = await TokenManager.getRefreshToken();
    // if (refreshToken != null) {
    //   try {
    //     final refreshTokenResponse = await _dio.post(
    //       AppUrls.refreshToken,
    //       data: {
    //         'refreshToken': refreshToken,
    //         'rememberMe': true,
    //       },
    //     );
    //
    //     late final data = refreshTokenResponse.data as Map<String, dynamic>?;
    //     if (refreshTokenResponse.success && data != null) {
    //       final accessToken = Token.fromMap(data['accessToken']).tokenBody;
    //       final newRefreshToken = Token.fromMap(data['refreshToken']).tokenBody;
    //
    //       await TokenManager.setAccessToken(accessToken);
    //       await TokenManager.setRefreshToken(newRefreshToken);
    //
    //       Utils.debugPrint(
    //         'Token refresh success, so repeat request with fresh one...',
    //       );
    //       final newResponse = await _dio.fetch(
    //         options..headers.addAll({'authorization': 'Bearer $accessToken'}),
    //       );
    //
    //       Utils.debugPrint('statusCode - ${newResponse.statusCode}');
    //       return handler.resolve(newResponse);
    //     }
    //   } catch (_) {}
    // }

    Utils.debugPrint('Can not refresh token. So, make log out');
    await App.globalKey.currentContext?.read<AppCubit>().logOut(withAPI: false);

    /// WARNING: The [handler] must call [resolve] or [reject] in ALL situations
    handler.reject(DioException(
      requestOptions: response.requestOptions,
      response: response,
    ));
  }
}

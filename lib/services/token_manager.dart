import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:space_x/common/utils/utils.dart';

class TokenManager {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  static const _storage = FlutterSecureStorage(
      // Uncomment, if some api calls will proceed when app is locked
      // iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      );

  static Future<bool> get isUserAuthenticated async {
    return await getAccessToken() != null;
  }

  static Future<String?> getAccessToken() async {
    try {
      return await _storage.read(key: _accessTokenKey);
    } catch (e) {
      Utils.debugPrint('FlutterSecureStorage getAccessToken error - $e');
      return null;
    }
  }

  static Future<void> setAccessToken(String? token) async {
    try {
      await _storage.write(key: _accessTokenKey, value: token);
    } catch (e) {
      Utils.debugPrint('FlutterSecureStorage setAccessToken error - $e');
    }
  }

  static Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      Utils.debugPrint('FlutterSecureStorage getRefreshToken error - $e');
      return null;
    }
  }

  static Future<void> setRefreshToken(String? token) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: token);
    } catch (e) {
      Utils.debugPrint('FlutterSecureStorage setRefreshToken error - $e');
    }
  }

  static Future<void> removeTokenData() async {
    try {
      await _storage.delete(key: _accessTokenKey);
      await _storage.delete(key: _refreshTokenKey);
    } catch (e) {
      Utils.debugPrint('FlutterSecureStorage removeTokenData error - $e');
    }
  }
}

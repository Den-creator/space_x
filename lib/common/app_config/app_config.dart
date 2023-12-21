// ignore_for_file: non_constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:space_x/common/app_config/env_type.dart';
import 'package:space_x/common/utils/utils.dart';

class AppConfig {
  static const appName = 'SpaceX';
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  static Future<void> load(EnvType type) async {
    await dotenv.load(fileName: type.fileName);
    Utils.debugPrint('BASE URL: $baseUrl');
  }
}

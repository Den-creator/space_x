import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:space_x/common/app_colors.dart';
import 'package:space_x/common/app_styles.dart';
import 'package:space_x/generated/locale_keys.g.dart';

class Utils {
  static void debugPrint(String? value) {
    if (kDebugMode) print(value);
  }

  static void showSnackBar(
    BuildContext context,
    String? message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: AppColors.shared.red,
        content: Text(
          message ?? LocaleKeys.something_went_wrong.tr(),
          style: AppStyles.interW400S16,
        ),
      ),
    );
  }
}

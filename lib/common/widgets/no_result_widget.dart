import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_x/common/app_colors.dart';
import 'package:space_x/common/app_resources.dart';
import 'package:space_x/common/app_styles.dart';
import 'package:space_x/generated/locale_keys.g.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppResources.astronautPng,
            width: 145.sp,
            height: 170.sp,
          ),
          SizedBox(height: 45.sp),
          Text(
            LocaleKeys.no_result_found_lost_in_space.tr().toUpperCase(),
            style: AppStyles.aksharW400S30,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.sp),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 216.sp,
              height: 54.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.shared.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.reload.tr(),
                    style: AppStyles.interW400S16,
                  ),
                  SizedBox(width: 14.sp),
                  SvgPicture.asset(AppResources.refreshIconSvg),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

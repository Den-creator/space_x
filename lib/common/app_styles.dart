import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/common/app_colors.dart';

class AppStyles {
  static final aksharW500S30 = TextStyle(
    fontFamily: _akshar,
    fontWeight: FontWeight.w500,
    fontSize: 30.sp,
    color: AppColors.shared.white,
  );

  static final aksharW400S30 = TextStyle(
    fontFamily: _akshar,
    fontWeight: FontWeight.w400,
    fontSize: 30.sp,
    color: AppColors.shared.white,
  );

  static final interW400S16 = TextStyle(
    fontFamily: _inter,
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: AppColors.shared.white,
  );

  static const _akshar = 'Akshar';
  static const _inter = 'Inter';
}

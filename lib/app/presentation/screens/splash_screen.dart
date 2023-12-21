import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_x/common/app_colors.dart';
import 'package:space_x/common/app_resources.dart';

@RoutePage<String>()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.shared.black,
      padding: EdgeInsets.only(left: 66.sp, right: 27.sp),
      child: SvgPicture.asset(AppResources.logoSvg),
    );
  }
}

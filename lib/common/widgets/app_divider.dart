import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/common/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sp,
      width: double.infinity,
      child: ColoredBox(color: AppColors.shared.white),
    );
  }
}

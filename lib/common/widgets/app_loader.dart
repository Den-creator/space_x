import 'package:flutter/material.dart';
import 'package:space_x/common/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.shared.white),
    );
  }
}

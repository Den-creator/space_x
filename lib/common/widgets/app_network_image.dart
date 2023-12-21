import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_x/common/app_colors.dart';
import 'package:space_x/common/app_resources.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
  });

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) return const _ErrorWidget();

    return CachedNetworkImage(
      imageUrl: url!,
      placeholder: (_, __) => ColoredBox(color: AppColors.shared.darkGrey),
      errorWidget: (_, __, ___) => const _ErrorWidget(),
      fit: BoxFit.cover,
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 97.sp, right: 57.sp),
      color: AppColors.shared.almostBlack,
      child: SvgPicture.asset(AppResources.logoSvg),
    );
  }
}

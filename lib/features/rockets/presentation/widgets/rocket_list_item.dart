import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_x/common/app_resources.dart';
import 'package:space_x/common/app_styles.dart';
import 'package:space_x/common/widgets/app_network_image.dart';
import 'package:space_x/features/rockets/data/models/rocket.dart';
import 'package:space_x/services/navigation/app_router.dart';

class RocketListItem extends StatelessWidget {
  const RocketListItem({
    super.key,
    required this.model,
  });
  final Rocket model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Of course we can pass here whole object [model],
      // but in most cases lists don't contain gull model info,
      // so we have to load on details page gull data
      onTap: () => context.router.push(
        RocketDetailsRoute(rocketId: model.rocketId),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.sp),
            child: SizedBox(
              height: 351.sp,
              child: AppNetworkImage(url: model.flickrImages.firstOrNull),
            ),
          ),
          SizedBox(height: 15.sp),
          Row(
            children: [
              Expanded(
                child: Text(
                  model.rocketName.toUpperCase(),
                  style: AppStyles.aksharW500S30,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppResources.chevronRightSvg),
              SizedBox(width: 5.5.sp),
            ],
          ),
        ],
      ),
    );
  }
}

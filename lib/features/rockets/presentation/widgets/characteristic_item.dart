import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/common/app_styles.dart';
import 'package:space_x/common/widgets/app_divider.dart';

class CharacteristicsItem extends StatelessWidget {
  const CharacteristicsItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.sp),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.interW400S16,
                ),
              ),
              const Spacer(),
              Text(
                value,
                style: AppStyles.interW400S16,
              ),
            ],
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}

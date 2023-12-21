import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/common/app_colors.dart';
import 'package:space_x/common/app_styles.dart';
import 'package:space_x/common/constants.dart';
import 'package:space_x/common/utils/utils.dart';
import 'package:space_x/common/widgets/app_divider.dart';
import 'package:space_x/common/widgets/app_loader.dart';
import 'package:space_x/common/widgets/app_network_image.dart';
import 'package:space_x/common/widgets/app_scaffold.dart';
import 'package:space_x/common/widgets/no_result_widget.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';
import 'package:space_x/features/rockets/presentation/logic/rockets_details/rockets_details_cubit.dart';
import 'package:space_x/features/rockets/presentation/widgets/characteristic_item.dart';
import 'package:space_x/generated/locale_keys.g.dart';

@RoutePage<String>()
class RocketDetailsScreen extends StatefulWidget {
  const RocketDetailsScreen({super.key, required this.rocketId});
  final String rocketId;

  @override
  State<RocketDetailsScreen> createState() => _RocketDetailsScreenState();
}

class _RocketDetailsScreenState extends State<RocketDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    // Restore the status bar
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocProvider(
        create: (_) => RocketsDetailsCubit(
          repository: context.read<RocketsRepository>(),
          id: widget.rocketId,
        ),
        child: BlocConsumer<RocketsDetailsCubit, RocketsDetailsState>(
          listener: (context, state) {
            if (state.status != RocketsDetailsStatus.failure) return;
            Utils.showSnackBar(context, state.errorMessage);
          },
          builder: (context, state) {
            if (state.status == RocketsDetailsStatus.loading) {
              return const AppLoader();
            }

            late final model = state.rocket;
            if (state.status == RocketsDetailsStatus.failure || model == null) {
              return NoResultWidget(
                onTap: context.read<RocketsDetailsCubit>().loadRocket,
              );
            }

            return Stack(
              children: [
                SizedBox(
                  height: 425.sp,
                  child: AppNetworkImage(url: model.flickrImages.firstOrNull),
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.55,
                  minChildSize: 0.55,
                  maxChildSize: 0.8,
                  builder: (context, controller) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.shared.almostBlack,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.sp),
                          topRight: Radius.circular(20.sp),
                        ),
                      ),
                      child: RefreshIndicator(
                        onRefresh: () => context
                            .read<RocketsDetailsCubit>()
                            .loadRocket(refreshMode: true),
                        child: ListView(
                          controller: controller,
                          padding: C.horizPadding15,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(height: 31.sp),
                            Text(
                              LocaleKeys.about_rocket.tr().toUpperCase(),
                              style: AppStyles.aksharW500S30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.sp),
                              child: const AppDivider(),
                            ),
                            Text(
                              model.description,
                              style: AppStyles.interW400S16,
                            ),
                            SizedBox(height: 30.sp),
                            Text(
                              LocaleKeys.characteristics.tr().toUpperCase(),
                              style: AppStyles.aksharW500S30,
                            ),
                            SizedBox(height: 15.sp),
                            const AppDivider(),
                            CharacteristicsItem(
                              title: LocaleKeys.height.tr(),
                              value:
                                  '${LocaleKeys.meters.tr()} : ${model.height.meters}',
                            ),
                            CharacteristicsItem(
                              title: LocaleKeys.diameter.tr(),
                              value:
                                  '${LocaleKeys.meters.tr()} : ${model.diameter.meters}',
                            ),
                            CharacteristicsItem(
                              title: LocaleKeys.mass.tr(),
                              value: '${LocaleKeys.kg.tr()} : ${model.mass.kg}',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

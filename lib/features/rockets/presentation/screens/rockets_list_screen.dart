import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/common/constants.dart';
import 'package:space_x/common/utils/utils.dart';
import 'package:space_x/common/widgets/app_loader.dart';
import 'package:space_x/common/widgets/app_scaffold.dart';
import 'package:space_x/common/widgets/no_result_widget.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';
import 'package:space_x/features/rockets/presentation/logic/rockets_list/rockets_list_cubit.dart';
import 'package:space_x/features/rockets/presentation/widgets/rocket_list_item.dart';

@RoutePage<String>()
class RocketsListScreen extends StatelessWidget {
  const RocketsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RocketsListCubit(
        repository: context.read<RocketsRepository>(),
      ),
      child: const _RocketsListView(),
    );
  }
}

class _RocketsListView extends StatelessWidget {
  const _RocketsListView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: AppScaffold(
        body: BlocConsumer<RocketsListCubit, RocketsListState>(
          listener: (context, state) {
            if (state.status != RocketsListStatus.failure) return;
            Utils.showSnackBar(context, state.errorMessage);
          },
          builder: (context, state) {
            if (state.status == RocketsListStatus.loading) {
              return const AppLoader();
            }

            if (state.status == RocketsListStatus.failure) {
              return NoResultWidget(
                onTap: context.read<RocketsListCubit>().loadRockets,
              );
            }

            return RefreshIndicator(
              onRefresh: () => context
                  .read<RocketsListCubit>()
                  .loadRockets(refreshMode: true),
              child: ListView.separated(
                padding: C.horizPadding15.copyWith(
                  bottom: MediaQuery.paddingOf(context).bottom,
                ),
                itemCount: state.rockets.length,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, __) => SizedBox(height: 40.sp),
                itemBuilder: (_, index) => RocketListItem(
                  model: state.rockets[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/features/rockets/data/models/rocket.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';

part 'rockets_details_state.dart';

class RocketsDetailsCubit extends Cubit<RocketsDetailsState> {
  RocketsDetailsCubit({
    required this.repository,
    required this.id,
  }) : super(const RocketsDetailsState()) {
    loadRocket();
  }

  final IRocketsRepository repository;
  final String id;

  Future<void> loadRocket({bool refreshMode = false}) async {
    emit(state.copyWith(
      status: refreshMode
          ? RocketsDetailsStatus.refreshing
          : RocketsDetailsStatus.loading,
    ));

    final result = await repository.loadRocket(id);
    result.fold(
      (l) => emit(state.copyWith(
        status: RocketsDetailsStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: RocketsDetailsStatus.success,
        rocket: r,
      )),
    );
  }
}

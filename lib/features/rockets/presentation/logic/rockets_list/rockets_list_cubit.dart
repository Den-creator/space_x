import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/features/rockets/data/models/rocket.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';

part 'rockets_list_state.dart';

class RocketsListCubit extends Cubit<RocketsListState> {
  RocketsListCubit({
    required this.repository,
  }) : super(const RocketsListState()) {
    loadRockets();
  }

  final IRocketsRepository repository;

  Future<void> loadRockets({bool refreshMode = false}) async {
    emit(state.copyWith(
      status: refreshMode
          ? RocketsListStatus.refreshing
          : RocketsListStatus.loading,
    ));

    final result = await repository.loadRockets();
    result.fold(
      (l) => emit(state.copyWith(
        status: RocketsListStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: RocketsListStatus.success,
        rockets: r,
      )),
    );
  }
}

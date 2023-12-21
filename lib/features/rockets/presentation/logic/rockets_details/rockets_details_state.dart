part of 'rockets_details_cubit.dart';

enum RocketsDetailsStatus { initial, loading, refreshing, success, failure }

class RocketsDetailsState extends Equatable {
  const RocketsDetailsState({
    this.status = RocketsDetailsStatus.initial,
    this.rocket,
    this.errorMessage,
  });

  final RocketsDetailsStatus status;
  final Rocket? rocket;
  final String? errorMessage;

  RocketsDetailsState copyWith({
    required RocketsDetailsStatus status,
    Rocket? rocket,
    String? errorMessage,
  }) {
    return RocketsDetailsState(
      status: status,
      rocket: rocket ?? this.rocket,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, rocket, errorMessage];
}

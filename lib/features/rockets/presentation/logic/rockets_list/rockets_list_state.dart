part of 'rockets_list_cubit.dart';

enum RocketsListStatus { initial, loading, refreshing, success, failure }

class RocketsListState extends Equatable {
  const RocketsListState({
    this.status = RocketsListStatus.initial,
    this.rockets = const [],
    this.errorMessage,
  });

  final RocketsListStatus status;
  final List<Rocket> rockets;
  final String? errorMessage;

  RocketsListState copyWith({
    required RocketsListStatus status,
    List<Rocket>? rockets,
    String? errorMessage,
  }) {
    return RocketsListState(
      status: status,
      rockets: rockets ?? this.rockets,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, rockets, errorMessage];
}

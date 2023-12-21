import 'package:space_x/features/rockets/data/models/thrust.dart';

class Stage {
  const Stage({
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
  });

  final bool reusable;
  final int engines;
  final double fuelAmountTons;
  final int burnTimeSec;
  final Thrust thrustSeaLevel;
  final Thrust thrustVacuum;

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      reusable: json['reusable'] as bool? ?? false,
      engines: json['engines'] as int? ?? 0,
      fuelAmountTons: (json['fuel_amount_tons'] as num?)?.toDouble() ?? 0.0,
      burnTimeSec: json['burn_time_sec'] as int? ?? 0,
      thrustSeaLevel: Thrust.fromJson(
          json['thrust_sea_level'] as Map<String, dynamic>? ?? {}),
      thrustVacuum:
          Thrust.fromJson(json['thrust_vacuum'] as Map<String, dynamic>? ?? {}),
    );
  }
}

import 'package:space_x/features/rockets/data/models/isp.dart';
import 'package:space_x/features/rockets/data/models/thrust.dart';

class Engine {
  const Engine({
    required this.number,
    required this.type,
    required this.version,
    required this.layout,
    required this.isp,
    required this.engineLossMax,
    required this.propellant1,
    required this.propellant2,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.thrustToWeight,
  });

  final int number;
  final String type;
  final String version;
  final String layout;
  final Isp isp;
  final int engineLossMax;
  final String propellant1;
  final String propellant2;
  final Thrust thrustSeaLevel;
  final Thrust thrustVacuum;
  final double thrustToWeight;

  factory Engine.fromJson(Map<String, dynamic> json) {
    return Engine(
      number: json['number'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      version: json['version'] as String? ?? '',
      layout: json['layout'] as String? ?? '',
      isp: Isp.fromJson(json['isp'] as Map<String, dynamic>? ?? {}),
      engineLossMax: json['engine_loss_max'] as int? ?? 0,
      propellant1: json['propellant_1'] as String? ?? '',
      propellant2: json['propellant_2'] as String? ?? '',
      thrustSeaLevel: Thrust.fromJson(
          json['thrust_sea_level'] as Map<String, dynamic>? ?? {}),
      thrustVacuum:
          Thrust.fromJson(json['thrust_vacuum'] as Map<String, dynamic>? ?? {}),
      thrustToWeight: (json['thrust_to_weight'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

import 'package:space_x/features/rockets/data/models/dimension.dart';
import 'package:space_x/features/rockets/data/models/engine.dart';
import 'package:space_x/features/rockets/data/models/landing_legs.dart';
import 'package:space_x/features/rockets/data/models/mass.dart';
import 'package:space_x/features/rockets/data/models/payload_weight.dart';
import 'package:space_x/features/rockets/data/models/stage.dart';

class Rocket {
  const Rocket({
    required this.id,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.height,
    required this.diameter,
    required this.mass,
    required this.payloadWeights,
    required this.firstStage,
    required this.secondStage,
    required this.engines,
    required this.landingLegs,
    required this.flickrImages,
    required this.wikipedia,
    required this.description,
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
  });

  final int id;
  final bool active;
  final int stages;
  final int boosters;
  final int costPerLaunch;
  final int successRatePct;
  final String firstFlight;
  final String country;
  final String company;
  final Dimension height;
  final Dimension diameter;
  final Mass mass;
  final List<PayloadWeight> payloadWeights;
  final Stage firstStage;
  final Stage secondStage;
  final Engine engines;
  final LandingLegs landingLegs;
  final List<String> flickrImages;
  final String wikipedia;
  final String description;
  final String rocketId;
  final String rocketName;
  final String rocketType;

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'] as int? ?? 0,
      active: json['active'] as bool? ?? false,
      stages: json['stages'] as int? ?? 0,
      boosters: json['boosters'] as int? ?? 0,
      costPerLaunch: json['cost_per_launch'] as int? ?? 0,
      successRatePct: json['success_rate_pct'] as int? ?? 0,
      firstFlight: json['first_flight'] as String? ?? '',
      country: json['country'] as String? ?? '',
      company: json['company'] as String? ?? '',
      height: Dimension.fromJson(json['height'] as Map<String, dynamic>? ?? {}),
      diameter:
          Dimension.fromJson(json['diameter'] as Map<String, dynamic>? ?? {}),
      mass: Mass.fromJson(json['mass'] as Map<String, dynamic>? ?? {}),
      payloadWeights: (json['payload_weights'] as List<dynamic>? ?? [])
          .map((e) => PayloadWeight.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstStage:
          Stage.fromJson(json['first_stage'] as Map<String, dynamic>? ?? {}),
      secondStage:
          Stage.fromJson(json['second_stage'] as Map<String, dynamic>? ?? {}),
      engines: Engine.fromJson(json['engines'] as Map<String, dynamic>? ?? {}),
      landingLegs: LandingLegs.fromJson(
          json['landing_legs'] as Map<String, dynamic>? ?? {}),
      flickrImages:
          List<String>.from(json['flickr_images'] as List<dynamic>? ?? []),
      wikipedia: json['wikipedia'] as String? ?? '',
      description: json['description'] as String? ?? '',
      rocketId: json['rocket_id'] as String? ?? '',
      rocketName: json['rocket_name'] as String? ?? '',
      rocketType: json['rocket_type'] as String? ?? '',
    );
  }
}

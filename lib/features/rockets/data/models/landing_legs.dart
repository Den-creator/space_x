class LandingLegs {
  const LandingLegs({
    required this.number,
    required this.material,
  });

  final int number;
  final String material;

  factory LandingLegs.fromJson(Map<String, dynamic> json) {
    return LandingLegs(
      number: json['number'] as int? ?? 0,
      material: json['material'] as String? ?? '',
    );
  }
}

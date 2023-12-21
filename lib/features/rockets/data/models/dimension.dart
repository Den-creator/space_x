class Dimension {
  const Dimension({
    required this.meters,
    required this.feet,
  });

  final double meters;
  final double feet;

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      meters: (json['meters'] as num?)?.toDouble() ?? 0.0,
      feet: (json['feet'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

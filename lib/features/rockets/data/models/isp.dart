class Isp {
  const Isp({
    required this.seaLevel,
    required this.vacuum,
  });

  final int seaLevel;
  final int vacuum;

  factory Isp.fromJson(Map<String, dynamic> json) {
    return Isp(
      seaLevel: json['sea_level'] as int? ?? 0,
      vacuum: json['vacuum'] as int? ?? 0,
    );
  }
}

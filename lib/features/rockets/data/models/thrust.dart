class Thrust {
  const Thrust({
    required this.kN,
    required this.lbf,
  });

  final int kN;
  final int lbf;

  factory Thrust.fromJson(Map<String, dynamic> json) {
    return Thrust(
      kN: json['kN'] as int? ?? 0,
      lbf: json['lbf'] as int? ?? 0,
    );
  }
}

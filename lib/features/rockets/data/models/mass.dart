class Mass {
  const Mass({
    required this.kg,
    required this.lb,
  });

  final int kg;
  final int lb;

  factory Mass.fromJson(Map<String, dynamic> json) {
    return Mass(
      kg: json['kg'] as int? ?? 0,
      lb: json['lb'] as int? ?? 0,
    );
  }
}

class PayloadWeight {
  const PayloadWeight({
    required this.id,
    required this.name,
    required this.kg,
    required this.lb,
  });

  final String id;
  final String name;
  final int kg;
  final int lb;

  factory PayloadWeight.fromJson(Map<String, dynamic> json) {
    return PayloadWeight(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      kg: json['kg'] as int? ?? 0,
      lb: json['lb'] as int? ?? 0,
    );
  }
}

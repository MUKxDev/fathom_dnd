import 'dart:convert';

class MoneySystem {
  final int platinum;
  final int gold;
  final int silver;
  final int copper;
  MoneySystem({
    required this.platinum,
    required this.gold,
    required this.silver,
    required this.copper,
  });

  MoneySystem copyWith({
    int? platinum,
    int? gold,
    int? silver,
    int? copper,
  }) {
    return MoneySystem(
      platinum: platinum ?? this.platinum,
      gold: gold ?? this.gold,
      silver: silver ?? this.silver,
      copper: copper ?? this.copper,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platinum': platinum,
      'gold': gold,
      'silver': silver,
      'copper': copper,
    };
  }

  factory MoneySystem.fromMap(Map<String, dynamic> map) {
    return MoneySystem(
      platinum: map['platinum']?.toInt() ?? 0,
      gold: map['gold']?.toInt() ?? 0,
      silver: map['silver']?.toInt() ?? 0,
      copper: map['copper']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoneySystem.fromJson(String source) =>
      MoneySystem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoneySystem(platinum: $platinum, gold: $gold, silver: $silver, copper: $copper)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoneySystem &&
        other.platinum == platinum &&
        other.gold == gold &&
        other.silver == silver &&
        other.copper == copper;
  }

  @override
  int get hashCode {
    return platinum.hashCode ^
        gold.hashCode ^
        silver.hashCode ^
        copper.hashCode;
  }
}

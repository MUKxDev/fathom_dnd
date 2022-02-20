import 'dart:convert';

class Tracker {
  final String name;
  final int base;
  final int current;
  Tracker({
    required this.name,
    required this.base,
    required this.current,
  });

  Tracker copyWith({
    String? name,
    int? base,
    int? current,
  }) {
    return Tracker(
      name: name ?? this.name,
      base: base ?? this.base,
      current: current ?? this.current,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'base': base,
      'current': current,
    };
  }

  factory Tracker.fromMap(Map<String, dynamic> map) {
    return Tracker(
      name: map['name'] ?? '',
      base: map['base']?.toInt() ?? 0,
      current: map['current']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tracker.fromJson(String source) =>
      Tracker.fromMap(json.decode(source));

  @override
  String toString() => 'Tracker(name: $name, base: $base, current: $current)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tracker &&
        other.name == name &&
        other.base == base &&
        other.current == current;
  }

  @override
  int get hashCode => name.hashCode ^ base.hashCode ^ current.hashCode;
}

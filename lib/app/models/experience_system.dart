import 'dart:convert';

import 'tracker.dart';

class ExperienceSystem {
  final int baseExp;
  final Tracker exp;
  final int level;
  ExperienceSystem({
    required this.baseExp,
    required this.exp,
    required this.level,
  });

  ExperienceSystem copyWith({
    int? baseExp,
    Tracker? exp,
    int? level,
  }) {
    return ExperienceSystem(
      baseExp: baseExp ?? this.baseExp,
      exp: exp ?? this.exp,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'baseExp': baseExp,
      'exp': exp.toMap(),
      'level': level,
    };
  }

  factory ExperienceSystem.fromMap(Map<String, dynamic> map) {
    return ExperienceSystem(
      baseExp: map['baseExp']?.toInt() ?? 0,
      exp: Tracker.fromMap(map['exp']),
      level: map['level']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperienceSystem.fromJson(String source) =>
      ExperienceSystem.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExperienceSystem(baseExp: $baseExp, exp: $exp, level: $level)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExperienceSystem &&
        other.baseExp == baseExp &&
        other.exp == exp &&
        other.level == level;
  }

  @override
  int get hashCode => baseExp.hashCode ^ exp.hashCode ^ level.hashCode;
}

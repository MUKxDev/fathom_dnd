import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'info.dart';

class SkillSystem {
  final List<Info> passiveSkills;
  final List<Info> classSkills;
  final List<Info> spells;
  SkillSystem({
    required this.passiveSkills,
    required this.classSkills,
    required this.spells,
  });

  SkillSystem copyWith({
    List<Info>? passiveSkills,
    List<Info>? classSkills,
    List<Info>? spells,
  }) {
    return SkillSystem(
      passiveSkills: passiveSkills ?? this.passiveSkills,
      classSkills: classSkills ?? this.classSkills,
      spells: spells ?? this.spells,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'passiveSkills': passiveSkills.map((x) => x.toMap()).toList(),
      'classSkills': classSkills.map((x) => x.toMap()).toList(),
      'spells': spells.map((x) => x.toMap()).toList(),
    };
  }

  factory SkillSystem.fromMap(Map<String, dynamic> map) {
    return SkillSystem(
      passiveSkills:
          List<Info>.from(map['passiveSkills']?.map((x) => Info.fromMap(x))),
      classSkills:
          List<Info>.from(map['classSkills']?.map((x) => Info.fromMap(x))),
      spells: List<Info>.from(map['spells']?.map((x) => Info.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillSystem.fromJson(String source) =>
      SkillSystem.fromMap(json.decode(source));

  @override
  String toString() =>
      'SkillSystem(passiveSkills: $passiveSkills, classSkills: $classSkills, spells: $spells)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SkillSystem &&
        listEquals(other.passiveSkills, passiveSkills) &&
        listEquals(other.classSkills, classSkills) &&
        listEquals(other.spells, spells);
  }

  @override
  int get hashCode =>
      passiveSkills.hashCode ^ classSkills.hashCode ^ spells.hashCode;
}

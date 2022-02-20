import 'dart:convert';

import 'package:fathom_dnd/app/models/tracker.dart';

import 'roll.dart';

class TrackerSystem {
  final Roll role;
  final Tracker hitPoints;
  final Tracker mana;
  final Tracker stamina;
  TrackerSystem({
    required this.role,
    required this.hitPoints,
    required this.mana,
    required this.stamina,
  });

  TrackerSystem copyWith({
    Roll? role,
    Tracker? hitPoints,
    Tracker? mana,
    Tracker? stamina,
  }) {
    return TrackerSystem(
      role: role ?? this.role,
      hitPoints: hitPoints ?? this.hitPoints,
      mana: mana ?? this.mana,
      stamina: stamina ?? this.stamina,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role.toMap(),
      'hitPoints': hitPoints.toMap(),
      'mana': mana.toMap(),
      'stamina': stamina.toMap(),
    };
  }

  factory TrackerSystem.fromMap(Map<String, dynamic> map) {
    return TrackerSystem(
      role: Roll.fromMap(map['role']),
      hitPoints: Tracker.fromMap(map['hitPoints']),
      mana: Tracker.fromMap(map['mana']),
      stamina: Tracker.fromMap(map['stamina']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackerSystem.fromJson(String source) =>
      TrackerSystem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrackerSystem(role: $role, hitPoints: $hitPoints, mana: $mana, stamina: $stamina)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackerSystem &&
        other.role == role &&
        other.hitPoints == hitPoints &&
        other.mana == mana &&
        other.stamina == stamina;
  }

  @override
  int get hashCode {
    return role.hashCode ^
        hitPoints.hashCode ^
        mana.hashCode ^
        stamina.hashCode;
  }
}

import 'dart:convert';

import 'package:fathom_dnd/app/models/status_system.dart';

import 'basic_info.dart';
import 'experience_system.dart';
import 'goal_system.dart';
import 'inventory_system.dart';
import 'money_system.dart';
import 'pet_system.dart';
import 'skill_system.dart';
import 'tokens.dart';
import 'tracker_system.dart';

class Character {
  final String? id;
  final String userId;

  final BasicInfo basicInfo;
  final Tokens? tokens;
  final GoalSystem? goalSystem;
  final SkillSystem? skillSystem;
  final TrackerSystem? trackerSystem;
  final ExperienceSystem? experienceSystem;
  final MoneySystem? moneySystem;
  final StatusSystem? statusSystem;
  final InventorySystem? inventorySystem;
  final PetSystem? petSystem;
  Character({
    this.id,
    required this.userId,
    required this.basicInfo,
    this.tokens,
    this.goalSystem,
    this.skillSystem,
    this.trackerSystem,
    this.experienceSystem,
    this.moneySystem,
    this.statusSystem,
    this.inventorySystem,
    this.petSystem,
  });

  Character copyWith({
    String? id,
    String? userId,
    BasicInfo? basicInfo,
    Tokens? tokens,
    GoalSystem? goalSystem,
    SkillSystem? skillSystem,
    TrackerSystem? trackerSystem,
    ExperienceSystem? experienceSystem,
    MoneySystem? moneySystem,
    StatusSystem? statusSystem,
    InventorySystem? inventorySystem,
    PetSystem? petSystem,
  }) {
    return Character(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      basicInfo: basicInfo ?? this.basicInfo,
      tokens: tokens ?? this.tokens,
      goalSystem: goalSystem ?? this.goalSystem,
      skillSystem: skillSystem ?? this.skillSystem,
      trackerSystem: trackerSystem ?? this.trackerSystem,
      experienceSystem: experienceSystem ?? this.experienceSystem,
      moneySystem: moneySystem ?? this.moneySystem,
      statusSystem: statusSystem ?? this.statusSystem,
      inventorySystem: inventorySystem ?? this.inventorySystem,
      petSystem: petSystem ?? this.petSystem,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'basicInfo': basicInfo.toMap(),
      'tokens': tokens?.toMap(),
      'goalSystem': goalSystem?.toMap(),
      'skillSystem': skillSystem?.toMap(),
      'trackerSystem': trackerSystem?.toMap(),
      'experienceSystem': experienceSystem?.toMap(),
      'moneySystem': moneySystem?.toMap(),
      'statusSystem': statusSystem?.toMap(),
      'inventorySystem': inventorySystem?.toMap(),
      'petSystem': petSystem?.toMap(),
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      userId: map['userId'] ?? '',
      basicInfo: BasicInfo.fromMap(map['basicInfo']),
      tokens: map['tokens'] != null ? Tokens.fromMap(map['tokens']) : null,
      goalSystem: map['goalSystem'] != null
          ? GoalSystem.fromMap(map['goalSystem'])
          : null,
      skillSystem: map['skillSystem'] != null
          ? SkillSystem.fromMap(map['skillSystem'])
          : null,
      trackerSystem: map['trackerSystem'] != null
          ? TrackerSystem.fromMap(map['trackerSystem'])
          : null,
      experienceSystem: map['experienceSystem'] != null
          ? ExperienceSystem.fromMap(map['experienceSystem'])
          : null,
      moneySystem: map['moneySystem'] != null
          ? MoneySystem.fromMap(map['moneySystem'])
          : null,
      statusSystem: map['statusSystem'] != null
          ? StatusSystem.fromMap(map['statusSystem'])
          : null,
      inventorySystem: map['inventorySystem'] != null
          ? InventorySystem.fromMap(map['inventorySystem'])
          : null,
      petSystem:
          map['petSystem'] != null ? PetSystem.fromMap(map['petSystem']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Character(id: $id, userId: $userId, basicInfo: $basicInfo, tokens: $tokens, goalSystem: $goalSystem, skillSystem: $skillSystem, trackerSystem: $trackerSystem, experienceSystem: $experienceSystem, moneySystem: $moneySystem, statusSystem: $statusSystem, inventorySystem: $inventorySystem, petSystem: $petSystem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Character &&
        other.id == id &&
        other.userId == userId &&
        other.basicInfo == basicInfo &&
        other.tokens == tokens &&
        other.goalSystem == goalSystem &&
        other.skillSystem == skillSystem &&
        other.trackerSystem == trackerSystem &&
        other.experienceSystem == experienceSystem &&
        other.moneySystem == moneySystem &&
        other.statusSystem == statusSystem &&
        other.inventorySystem == inventorySystem &&
        other.petSystem == petSystem;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        basicInfo.hashCode ^
        tokens.hashCode ^
        goalSystem.hashCode ^
        skillSystem.hashCode ^
        trackerSystem.hashCode ^
        experienceSystem.hashCode ^
        moneySystem.hashCode ^
        statusSystem.hashCode ^
        inventorySystem.hashCode ^
        petSystem.hashCode;
  }
}

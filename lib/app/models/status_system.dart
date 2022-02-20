import 'dart:convert';

class StatusSystem {
  final int strength;
  final int dexterity;
  final int charisma;
  final int intelligence;
  final int wisdom;
  final int constitution;
  StatusSystem({
    required this.strength,
    required this.dexterity,
    required this.charisma,
    required this.intelligence,
    required this.wisdom,
    required this.constitution,
  });

  StatusSystem copyWith({
    int? strength,
    int? dexterity,
    int? charisma,
    int? intelligence,
    int? wisdom,
    int? constitution,
  }) {
    return StatusSystem(
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      charisma: charisma ?? this.charisma,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      constitution: constitution ?? this.constitution,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strength': strength,
      'dexterity': dexterity,
      'charisma': charisma,
      'intelligence': intelligence,
      'wisdom': wisdom,
      'constitution': constitution,
    };
  }

  factory StatusSystem.fromMap(Map<String, dynamic> map) {
    return StatusSystem(
      strength: map['strength']?.toInt() ?? 0,
      dexterity: map['dexterity']?.toInt() ?? 0,
      charisma: map['charisma']?.toInt() ?? 0,
      intelligence: map['intelligence']?.toInt() ?? 0,
      wisdom: map['wisdom']?.toInt() ?? 0,
      constitution: map['constitution']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusSystem.fromJson(String source) =>
      StatusSystem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StatusSystem(strength: $strength, dexterity: $dexterity, charisma: $charisma, intelligence: $intelligence, wisdom: $wisdom, constitution: $constitution)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatusSystem &&
        other.strength == strength &&
        other.dexterity == dexterity &&
        other.charisma == charisma &&
        other.intelligence == intelligence &&
        other.wisdom == wisdom &&
        other.constitution == constitution;
  }

  @override
  int get hashCode {
    return strength.hashCode ^
        dexterity.hashCode ^
        charisma.hashCode ^
        intelligence.hashCode ^
        wisdom.hashCode ^
        constitution.hashCode;
  }
}

import 'dart:convert';

import 'info.dart';

class PetSystem {
  final Info pet;
  PetSystem({
    required this.pet,
  });

  PetSystem copyWith({
    Info? pet,
  }) {
    return PetSystem(
      pet: pet ?? this.pet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pet': pet.toMap(),
    };
  }

  factory PetSystem.fromMap(Map<String, dynamic> map) {
    return PetSystem(
      pet: Info.fromMap(map['pet']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PetSystem.fromJson(String source) =>
      PetSystem.fromMap(json.decode(source));

  @override
  String toString() => 'PetSystem(pet: $pet)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PetSystem && other.pet == pet;
  }

  @override
  int get hashCode => pet.hashCode;
}

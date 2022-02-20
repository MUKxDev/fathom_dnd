import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fathom_dnd/app/models/info.dart';

class InventorySystem {
  final List<Info> items;
  final List<Info> consumables;
  final List<Info> weapons;
  final List<Info> armors;
  InventorySystem({
    required this.items,
    required this.consumables,
    required this.weapons,
    required this.armors,
  });

  InventorySystem copyWith({
    List<Info>? items,
    List<Info>? consumables,
    List<Info>? weapons,
    List<Info>? armors,
  }) {
    return InventorySystem(
      items: items ?? this.items,
      consumables: consumables ?? this.consumables,
      weapons: weapons ?? this.weapons,
      armors: armors ?? this.armors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'consumables': consumables.map((x) => x.toMap()).toList(),
      'weapons': weapons.map((x) => x.toMap()).toList(),
      'armors': armors.map((x) => x.toMap()).toList(),
    };
  }

  factory InventorySystem.fromMap(Map<String, dynamic> map) {
    return InventorySystem(
      items: List<Info>.from(map['items']?.map((x) => Info.fromMap(x))),
      consumables:
          List<Info>.from(map['consumables']?.map((x) => Info.fromMap(x))),
      weapons: List<Info>.from(map['weapons']?.map((x) => Info.fromMap(x))),
      armors: List<Info>.from(map['armors']?.map((x) => Info.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory InventorySystem.fromJson(String source) =>
      InventorySystem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InventorySystem(items: $items, consumables: $consumables, weapons: $weapons, armors: $armors)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InventorySystem &&
        listEquals(other.items, items) &&
        listEquals(other.consumables, consumables) &&
        listEquals(other.weapons, weapons) &&
        listEquals(other.armors, armors);
  }

  @override
  int get hashCode {
    return items.hashCode ^
        consumables.hashCode ^
        weapons.hashCode ^
        armors.hashCode;
  }
}

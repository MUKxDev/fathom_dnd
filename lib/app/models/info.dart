import 'dart:convert';

import 'package:flutter/foundation.dart';

class Info {
  final String name;
  final String? description;
  final List<String>? sections;
  final int? quantity;
  Info({
    required this.name,
    this.description,
    this.sections,
    this.quantity,
  });

  Info copyWith({
    String? name,
    String? description,
    List<String>? sections,
    int? quantity,
  }) {
    return Info(
      name: name ?? this.name,
      description: description ?? this.description,
      sections: sections ?? this.sections,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'sections': sections,
      'quantity': quantity,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      name: map['name'] ?? '',
      description: map['description'],
      sections: List<String>.from(map['sections']),
      quantity: map['quantity']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) => Info.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Info(name: $name, description: $description, sections: $sections, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Info &&
        other.name == name &&
        other.description == description &&
        listEquals(other.sections, sections) &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        sections.hashCode ^
        quantity.hashCode;
  }
}

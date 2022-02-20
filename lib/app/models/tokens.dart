import 'dart:convert';

import 'info.dart';

class Tokens {
  final Info birthdayGift;
  final int honestyToken;
  final int prestigeToken;
  final int finalBossToken;
  Tokens({
    required this.birthdayGift,
    required this.honestyToken,
    required this.prestigeToken,
    required this.finalBossToken,
  });

  Tokens copyWith({
    Info? birthdayGift,
    int? honestyToken,
    int? prestigeToken,
    int? finalBossToken,
  }) {
    return Tokens(
      birthdayGift: birthdayGift ?? this.birthdayGift,
      honestyToken: honestyToken ?? this.honestyToken,
      prestigeToken: prestigeToken ?? this.prestigeToken,
      finalBossToken: finalBossToken ?? this.finalBossToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'birthdayGift': birthdayGift.toMap(),
      'honestyToken': honestyToken,
      'prestigeToken': prestigeToken,
      'finalBossToken': finalBossToken,
    };
  }

  factory Tokens.fromMap(Map<String, dynamic> map) {
    return Tokens(
      birthdayGift: Info.fromMap(map['birthdayGift']),
      honestyToken: map['honestyToken']?.toInt() ?? 0,
      prestigeToken: map['prestigeToken']?.toInt() ?? 0,
      finalBossToken: map['finalBossToken']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tokens.fromJson(String source) => Tokens.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tokens(birthdayGift: $birthdayGift, honestyToken: $honestyToken, prestigeToken: $prestigeToken, finalBossToken: $finalBossToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tokens &&
        other.birthdayGift == birthdayGift &&
        other.honestyToken == honestyToken &&
        other.prestigeToken == prestigeToken &&
        other.finalBossToken == finalBossToken;
  }

  @override
  int get hashCode {
    return birthdayGift.hashCode ^
        honestyToken.hashCode ^
        prestigeToken.hashCode ^
        finalBossToken.hashCode;
  }
}

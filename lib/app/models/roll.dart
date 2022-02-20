import 'dart:convert';

class Roll {
  final int quantity;
  final int dice;
  Roll({
    required this.quantity,
    required this.dice,
  });

  Roll copyWith({
    int? quantity,
    int? dice,
  }) {
    return Roll(
      quantity: quantity ?? this.quantity,
      dice: dice ?? this.dice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'dice': dice,
    };
  }

  factory Roll.fromMap(Map<String, dynamic> map) {
    return Roll(
      quantity: map['quantity']?.toInt() ?? 0,
      dice: map['dice']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Roll.fromJson(String source) => Roll.fromMap(json.decode(source));

  @override
  String toString() => 'Roll(quantity: $quantity, dice: $dice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Roll && other.quantity == quantity && other.dice == dice;
  }

  @override
  int get hashCode => quantity.hashCode ^ dice.hashCode;
}

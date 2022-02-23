import 'dart:convert';

class BasicInfo {
  final String name;
  final String race;
  final String characterClass;
  final bool isAlive;
  final String? backStory;
  final String? image;
  BasicInfo({
    required this.name,
    required this.race,
    required this.characterClass,
    required this.isAlive,
    this.backStory,
    this.image,
  });

  BasicInfo copyWith({
    String? name,
    String? race,
    String? characterClass,
    bool? isAlive,
    String? backStory,
    String? image,
  }) {
    return BasicInfo(
      name: name ?? this.name,
      race: race ?? this.race,
      characterClass: characterClass ?? this.characterClass,
      isAlive: isAlive ?? this.isAlive,
      backStory: backStory ?? this.backStory,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'race': race,
      'characterClass': characterClass,
      'isAlive': isAlive,
      'backStory': backStory,
      'image': image,
    };
  }

  factory BasicInfo.fromMap(Map<String, dynamic> map) {
    return BasicInfo(
      name: map['name'] ?? '',
      race: map['race'] ?? '',
      characterClass: map['characterClass'] ?? '',
      isAlive: map['isAlive'] ?? false,
      backStory: map['backStory'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicInfo.fromJson(String source) =>
      BasicInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BasicInfo(name: $name, race: $race, characterClass: $characterClass, isAlive: $isAlive, backStory: $backStory, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicInfo &&
        other.name == name &&
        other.race == race &&
        other.characterClass == characterClass &&
        other.isAlive == isAlive &&
        other.backStory == backStory &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        race.hashCode ^
        characterClass.hashCode ^
        isAlive.hashCode ^
        backStory.hashCode ^
        image.hashCode;
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'info.dart';

class GoalSystem {
  final Info goal;
  final List<Info> tasks;
  GoalSystem({
    required this.goal,
    required this.tasks,
  });

  GoalSystem copyWith({
    Info? goal,
    List<Info>? tasks,
  }) {
    return GoalSystem(
      goal: goal ?? this.goal,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'goal': goal.toMap(),
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory GoalSystem.fromMap(Map<String, dynamic> map) {
    return GoalSystem(
      goal: Info.fromMap(map['goal']),
      tasks: List<Info>.from(map['tasks']?.map((x) => Info.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GoalSystem.fromJson(String source) =>
      GoalSystem.fromMap(json.decode(source));

  @override
  String toString() => 'GoalSystem(goal: $goal, tasks: $tasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoalSystem &&
        other.goal == goal &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => goal.hashCode ^ tasks.hashCode;
}

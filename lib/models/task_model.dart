// ignore_for_file: prefer_const_constructors

import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final DateTime creatAt;

  @HiveField(3)
  bool isCompleted;

  Task(
      {required this.id,
      required this.name,
      required this.creatAt,
      required this.isCompleted});

  factory Task.create({
    required String name,
    required DateTime creatAt,
  }) {
    return Task(
        id: Uuid().v1(), name: name, creatAt: creatAt, isCompleted: false);
  }
}

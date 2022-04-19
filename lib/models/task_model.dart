// ignore_for_file: prefer_const_constructors

import 'package:uuid/uuid.dart';

class Task {
  final String id;
  String name;
  final DateTime creatAt;
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

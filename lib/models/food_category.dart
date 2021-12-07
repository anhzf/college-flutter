import 'dart:math';

import 'package:college_flutter_app/db.dart';

class FoodCategory {
  static const PRIORITY_MIN = 1;
  static const PRIORITY_MAX = 3;

  int id;
  String name;
  int priority;

  FoodCategory(
    this.id,
    this.name,
    this.priority,
  );

  FoodCategory.create(String name)
      : id = 0,
        name = name,
        priority = Random().nextInt(PRIORITY_MAX) + PRIORITY_MIN;

  FoodCategory.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        priority = map['priority'];

  Future save() async {
    final db = await DB().db;

    if (id == 0) {
      id = await db.insert('food_categories', toMap());
    } else {
      await db
          .update('food_categories', toMap(), where: 'id = ?', whereArgs: [id]);
    }
  }

  Future delete() async {
    final db = await DB().db;

    return await db.delete('food_categories', where: 'id = ?', whereArgs: [id]);
  }

  toMap() => {
        'id': (id == 0) ? null : id,
        'name': name,
        'priority': priority,
      };

  static Future<List<FoodCategory>> getAll() async {
    final db = await DB().db;
    final maps = await db.query('food_categories');

    return maps.map((map) => FoodCategory.fromMap(map)).toList();
  }
}

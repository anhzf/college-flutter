import 'package:college_flutter_app/db.dart';

class Food {
  int id;
  int categoryId;
  String name;
  int qty;
  String unit;
  String note;

  Food(
    this.id,
    this.categoryId,
    this.name,
    this.qty,
    this.unit,
    this.note,
  );

  Food.create(int categoryId, String name, [String unit = ''])
      : id = 0,
        categoryId = categoryId,
        name = name,
        qty = 1,
        unit = unit,
        note = '';

  Food.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        categoryId = map['category_id'],
        qty = map['qty'],
        unit = map['unit'],
        note = map['note'];

  Future<void> save() async {
    final db = await DB().db;

    if (id == 0) {
      id = await db.insert('foods', toMap());
    } else {
      await db.update('foods', toMap(), where: 'id = ?', whereArgs: [id]);
    }
  }

  Future delete() async {
    final db = await DB().db;

    return await db.delete('foods', where: 'id = ?', whereArgs: [id]);
  }

  toMap() => {
        'id': (id == 0) ? null : id,
        'category_id': categoryId,
        'name': name,
        'qty': qty,
        'unit': unit,
        'note': note,
      };

  static Future<List<Food>> getAll() async {
    final db = await DB().db;
    final maps = await db.query('foods');

    return maps.map((map) => Food.fromMap(map)).toList();
  }

  static Future<List<Food>> getAllByCategory(int categoryId) async {
    final db = await DB().db;
    final maps = await db.query(
      'foods',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );

    return maps.map((map) => Food.fromMap(map)).toList();
  }
}

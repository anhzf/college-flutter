import 'dart:convert';
import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  DB._singleton();
  static final DB instance = DB._singleton();

  final int version = 1;
  Database? _db;

  Future<Database> get db async => _db ??= await _initDb();

  factory DB() => instance;

  Future test() async {
    try {
      final db = await _initDb();

      final categories = await db.query('food_categories');
      final foods = await db.query('foods');

      print(jsonEncode(categories));
      print(jsonEncode(foods));
      print('DB test passed ✔️');
    } catch (e) {
      print(e);
      print('DB test failed ❌');
    }
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'food_catalog.db');

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: version,
    );
  }

  Future _seed() async {
    const categories = [
      'Beverages',
      'Breads',
      'Breakfast',
      'Canned',
      'Cereals',
      'Condiments',
      'Dairy',
      'Desserts',
      'Fruits',
      'Grains',
      'Meat',
      'Produce',
      'Seafood',
      'Snacks',
      'Sweets',
      'Vegetables',
    ];
    const foods = [
      'Apple',
      'Apricot',
      'Avocado',
      'Banana',
      'Blackberry',
      'Blueberry',
      'Cherry',
      'Coconut',
      'Cranberry',
      'Fig',
      'Grape',
      'Grapefruit',
      'Guava',
      'Kiwi',
      'Lemon',
      'Lime',
      'Mango',
      'Melon',
      'Orange',
      'Papaya',
      'Peach',
      'Pear',
      'Pineapple',
      'Plum',
      'Pomegranate',
      'Raspberry',
      'Strawberry',
      'Watermelon',
    ];
    final db = await this.db;

    await db.transaction((txn) async {
      for (var i = 0; i < categories.length; i++) {
        await txn.rawInsert(
          'INSERT INTO food_categories (name, priority) VALUES (?, ?)',
          [categories[i], 1],
        );
      }

      for (var i = 0; i < foods.length; i++) {
        await txn.rawInsert(
          'INSERT INTO foods (name, category_id) VALUES (?, ?)',
          [foods[i], Random().nextInt(categories.length) + 1],
        );
      }
    });
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE food_categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        priority INTEGER NOT NULL DEFAULT 1
      )
    ''');

    await db.execute('''
      CREATE TABLE foods (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        qty INTEGER NOT NULL DEFAULT 1,
        unit TEXT NOT NULL DEFAULT '',
        note TEXT NOT NULL DEFAULT '',
        category_id INTEGER NOT NULL,
        FOREIGN KEY(category_id) REFERENCES food_categories(id) ON DELETE CASCADE
      )
    ''');

    await _seed();
  }
}

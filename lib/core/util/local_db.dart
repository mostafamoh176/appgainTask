import 'package:appgain_task/feature/questionnaire_feature/data/models/questations_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  // Singleton instance of the database
  static Database? _database;

  // Private constructor to prevent instantiation
  MyDatabase._();

  // Singleton pattern to ensure only one instance of the database
  static final MyDatabase instance = MyDatabase._();

  // Database file name
  static const String dbName = 'my_database.db';

  // Define your table and columns
  static const String table = 'items';
  static const String columnId = 'id';
  static const String columnName = 'name';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // If the database does not exist, create it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), dbName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE CASHEDDATA (
            id INTEGER PRIMARY KEY,
            items TEXT
          )
        ''');
      },
    );
  }

  // CRUD operations

  Future<int> insertItem(item) async {
    final db = await database;
    return db.insert(table, item);
  }

  Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await database;
    return db.query(table);
  }

  Future<int> updateItem(Map<String, dynamic> item) async {
    final db = await database;
    return db.update(
      table,
      item,
      where: '$columnId = ?',
      whereArgs: [item[columnId]],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        restaurantName TEXT,
        imageUrl TEXT,
        distance REAL
      )
    ''');
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return db.query('favorites');
  }

  Future<void> insertFavorite(Map<String, dynamic> favorite) async {
    final db = await database;
    await db.insert('favorites', favorite);
  }

  Future<void> deleteFavorite(String restaurantName) async {
    final db = await database;
    await db.delete('favorites', where: 'restaurantName = ?', whereArgs: [restaurantName]);
  }
}

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> getDatabase() async {
    // Get a location using getDatabasesPath
    var db = await sql.getDatabasesPath();
    var dbpath = path.join(db, 'places.db');

    // Open the database
    sql.Database database = await sql.openDatabase(
      dbpath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
    );
    return database;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    var database = await DBHelper.getDatabase();
    await database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    var database = await DBHelper.getDatabase();
    var results = await database.query(table);
    return results;
  }
}

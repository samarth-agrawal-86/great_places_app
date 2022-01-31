import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> getDatabase() async {
    // Get a location using getDatabasesPath
    var db = await sql.getDatabasesPath();

    print('DB Path : $db');
    // DB Path : /Users/samarth/Library/Developer/CoreSimulator/Devices/34FF30F0-5D51-4BFC-B7AA-C4EDFE41E557/data/Containers/Data/Application/
    // C4C21A8E-D9E3-4131-A8F6-B064FE4035AF/Documents
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

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "note.db";
  static final _databaseVersion = 1;

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE mytable (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
  }

  //QUERY ROWS
  Future<List<Map<String, dynamic>>> queryRows(
      String table, String where, List<Object> whereArgs) async {
    Database db = await instance.database;
    return await db.query(table, where: where, whereArgs: whereArgs);
  }

  //INSERT ROW
  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  //UPDATE ROW
  Future<int> update(String table, Map<String, dynamic> row, String where,
      List<Object> whereArgs) async {
    Database db = await instance.database;
    return await db.update(table, row, where: where, whereArgs: whereArgs);
  }

  //DELETE ROW
  Future<int> delete(String table, String where, List<Object> whereArgs) async {
    Database db = await instance.database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }
}

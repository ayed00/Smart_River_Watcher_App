import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:Smart_River_Watcher_App/models/capture.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;
  String tableName = "capture_table";
  String _id = "id";
  String _user = "user";
  String _valcapture = "valcapture";
  String _date = "date";
  String _heure = "heure";
  String _location = "location";
  String _latitude = "latitude";
  String _longitude = "longitude";
  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'capture.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //create all tables
      db.execute(
          "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY , $_user TEXT,$_valcapture TEXT,$_date TEXT,$_heure TEXT,$_location TEXT,$_latitude TEXT,$_longitude TEXT)");
    });
    return _db;
  }

  Future<int> createCapture(Capture capture) async {
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert(tableName, capture.toMap());
  }

  Future<List> allCapture() async {
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query(tableName);
  }

  Future<int> deleteCapture(int id) async {
    Database db = await createDatabase();
    // return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return db.delete(
      tableName,
    );
  }

  Future<int> deleteonlyCapture(int id) async {
    Database db = await createDatabase();
    return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    //return db.delete(
    //tableName,
    //);
  }
}

class DbHelper2 {
  static final DbHelper2 _instance2 = DbHelper2.internal();
  factory DbHelper2() => _instance2;
  DbHelper2.internal();
  static Database _db2;
  String tableName2 = "capture2_table";
  String _id2 = "id2";
  String _user2 = "user2";
  String _valcapture2 = "valcapture2";
  String _date2 = "date2";
  String _location2 = "location2";
  String _latitude2 = "latitude2";
  String _longitude2 = "longitude2";
  Future<Database> createDatabase2() async {
    if (_db2 != null) {
      return _db2;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'capture2.db');
    _db2 =
        await openDatabase(path, version: 1, onCreate: (Database db2, int v) {
      //create all tables
      db2.execute(
          "CREATE TABLE $tableName2($_id2 INTEGER PRIMARY KEY , $_user2 TEXT,$_valcapture2 TEXT,$_date2 TEXT,$_location2 TEXT,$_latitude2 TEXT,$_longitude2 TEXT)");
    });
    return _db2;
  }

  Future<int> createCapture2(Capture2 capture2) async {
    Database db2 = await createDatabase2();
    //db.rawInsert('insert into courses')
    return db2.insert(tableName2, capture2.toMap());
  }

  Future<List> allCapture2() async {
    Database db2 = await createDatabase2();
    //db.rawQuery("select * from courses")
    return db2.query(tableName2);
  }

  Future<int> deleteCapture2(int id) async {
    Database db2 = await createDatabase2();
    // return db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    return db2.delete(
      tableName2,
    );
  }

  Future<int> deleteonlyCapture2(int id) async {
    Database db2 = await createDatabase2();
    return db2.delete(tableName2, where: 'id = ?', whereArgs: [id]);
    //return db.delete(
    //tableName,
    //);
  }
}

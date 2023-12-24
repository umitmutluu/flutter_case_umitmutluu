import 'package:flutter_case_umitmutluu/data/models/home_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DBHelper {

  DBHelper._();
  static final DBHelper instance = DBHelper._();
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _openDB();
    return _db!;
  }

  Future<Database> _openDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, "database.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE CombinedModel ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "imageUrl String,"
            "type String,"
            "name String,"
            "explanation String"
            ")");
      },
    );
  }

  Future<int> saveModel(CombinedList test) async {
    await database;
    final count = await _db!.insert("CombinedModel", test.toJson());
    return count;
  }

  Future<CombinedList?> getModel(int id) async {
    await database;
    final res = await _db!.query(
      "CombinedModel",
      where: "id = ?",
      whereArgs: [id],
    );
    return res.isEmpty ? null : CombinedList.fromJson(res.first);
  }

  Future<List<CombinedList>> getAllModel() async {
    await database;
    final res = await _db!.query("CombinedModel");
    final List<CombinedList> list = res.isEmpty
        ? []
        : res.map((c) => CombinedList.fromJson(c)).toList().reversed.toList();
    return list;
  }

  Future<int> updateModel(CombinedList newTest) async {
    await database;
    final count = await _db!.update(
      "CombinedModel",
      newTest.toJson(),
      where: "id = ?",
      whereArgs: [newTest.id],
    );
    return count;
  }

  Future<int> deleteModelFromId(int id) async {
    await database;
    final count = await _db!.delete(
      "CombinedModel",
      where: "id = ?",
      whereArgs: [id],
    );
    return count;
  }

  Future<int> deleteAllModels() async {
    await database;
    final count = await _db!.delete("CombinedModel");
    return count;
  }
}

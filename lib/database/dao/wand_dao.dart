import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/wand.dart';
import 'package:sqflite/sqflite.dart';

class WandDao {
  static const String _tableName = 'wand';
  static const String wood = 'wood';
  static const String core = 'core';
  static const String length = 'length';
  static const String id = 'idWand';

  static const String createTableWandSql = 'CREATE TABLE $_tableName('
      '$id TEXT PRIMARY KEY UNIQUE, '
      '$wood TEXT, '
      '$core TEXT, '
      '$length TEXT'
      ')';

  Future<int> save(Wand wand) async {
    final Database db = await getDatabase();
    Map<String, dynamic> wandMap = _getMap(wand);
    return db.insert(_tableName, wandMap);
  }

  Map<String, dynamic> _getMap(Wand wand) {
    final Map<String, dynamic> wandMap = Map();
    wandMap[id] = wand.idWand;
    wandMap[wood] = wand.wood;
    wandMap[core] = wand.core;
    wandMap[length] = wand.length;
    return wandMap;
  }

  Future<bool> containsWand(String id) async {
    final Database database = await getDatabase();
    List<Map<String, dynamic>> data =
        await database.rawQuery('SELECT * FROM wand WHERE idWand = ?', [id]);
    return data.length > 0;
  }
}

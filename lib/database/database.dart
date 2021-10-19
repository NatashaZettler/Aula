import 'package:flutter_application_1/database/dao/student_dao.dart';
import 'package:flutter_application_1/database/dao/wand_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'happy_potter.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(WandDao.createTableWandSql);
      db.execute(StudentDao.createTableStudentSql);
    },
    version: 2,
  );
}

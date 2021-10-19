import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/model/wand.dart';
import 'package:sqflite/sqflite.dart';

class StudentDao {
  static const String _tableName = 'students';
  static const String _id = 'idStudent';
  static const String _name = 'name';
  static const String _path = 'path';
  static const String _species = 'species';
  static const String _idWand = 'idWand';

  static const String createTableStudentSql = 'CREATE TABLE $_tableName('
      '$_id TEXT PRIMARY KEY UNIQUE, '
      '$_name TEXT, '
      '$_path TEXT, '
      '$_species TEXT,'
      '$_idWand TEXT,'
      'FOREIGN KEY ($_idWand) REFERENCES wand ($_idWand)'
      ')';
// faltou a tabela '$_idWand TEXT,'

// Unhandled Exception: DatabaseException(UNIQUE constraint failed: students.idStudent (code 1555)) sql 'INSERT INTO students (name, path, species, idWand, idStudent) VALUES (?, ?, ?, ?, ?)' args [Theodore Nott, , human, -, Theodore Nott-human]
//
  Future<int> save(Student student) async {
    final Database db = await getDatabase();
    Map<String, dynamic> studentMap = _getMap(student);
    return db.insert(_tableName, studentMap);
  }

  Map<String, dynamic> _getMap(Student student) {
    final Map<String, dynamic> studentMap = Map();
    studentMap[_name] = student.name;
    studentMap[_path] = student.path;
    studentMap[_species] = student.species;
    studentMap[_idWand] = student.wand.idWand;
    studentMap[_id] = student.idStudent;
    return studentMap;
  }

  Future<bool> containsStudent(String id) async {
    final Database database = await getDatabase();
    List<Map<String, dynamic>> data = await database
        .rawQuery('SELECT * FROM students WHERE idStudent = ?', [id]);
    return data.length > 0;
  }

  Future<List<Student>> getAllStudents() async {
    final Database database = await getDatabase();
    List<Map<String, dynamic>> data = await database
        .rawQuery('SELECT * FROM students s, wand w WHERE s.idWand = w.idWand');
    return _toList(data);
  }

  List<Student> _toList(List<Map<String, dynamic>> result) {
    final List<Student> students = [];
    for (Map<String, dynamic> row in result) {
      final Student student = Student(
        row[_id],
        row[_name],
        row[_path],
        row[_species],
        Wand(
          row[_idWand],
          row['wood'],
          row['core'],
          row['length'],
        ),
      );
      students.add(student);
    }
    return students;
  }
}

import 'package:flutter_application_1/database/dao/student_dao.dart';
import 'package:flutter_application_1/database/dao/wand_dao.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/service/api.dart';

class StudentRepository {
  final api = Api();
  final studentDao = StudentDao();
  final wandDao = WandDao();

  Future<List<Student>> getAllStudents() async {
    try {
      final List<Student> students = await this.api.readApi();
      students.forEach((student) {
        this.save(student);
      });
      return students;
    } catch (e) {
      return studentDao.getAllStudents();
    }
  }

  Future<void> save(Student student) async {
    if (student.wand.isValid() &&
        !await wandDao.containsWand(student.wand.idWand)) {
      await this.wandDao.save(student.wand);
    }

    if (student.isValid() &&
        !await studentDao.containsStudent(student.idStudent)) {
      await this.studentDao.save(student);
    }
  }
}

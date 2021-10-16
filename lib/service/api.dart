// Pasta: service
// Nome do arquivo: api.dart

import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_application_1/model/student.dart';
import 'package:http/http.dart' as http;

class Api {
  static Uri get urlBase =>
      Uri.parse('http://hp-api.herokuapp.com/api/characters/students');

  Future<List<Student>> readJson() async {
    final response = await rootBundle.loadString('assets/students.json');
    final List<dynamic> data = jsonDecode(response);
    return data.map((student) => Student.fromJson(student)).toList();
  }

  Future<List<Student>> readApi() async {
    final response = await http.get(urlBase);
    final List<dynamic> data = jsonDecode(response.body);
    print('data -> $data');
    return data.map((student) => Student.fromJson(student)).toList();
  }
}

import 'package:flutter_application_1/model/wand.dart';

class Student {
  final String name;
  final String path;
  final String species;
  final Wand wand;

  Student(this.name, this.path, this.species, this.wand);

  Student.fromJson(Map<String, dynamic> json):
    name = json['name'],
    path = json['image'],
    species = json['species'],
    wand = Wand.fromJson(json['wand']);
}

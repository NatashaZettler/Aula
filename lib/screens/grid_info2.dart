import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/loading.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/repository/student_repository.dart';
import 'package:flutter_application_1/screens/details.dart';
import 'package:flutter_application_1/service/api.dart';

class GridInfo2 extends StatelessWidget {
  final _studentRepository = StudentRepository();
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Potter'),
      ),
      body: FutureBuilder<List<Student>>(
        future: _studentRepository.getAllStudents(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Loading();
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (snapshot.hasData) {
                this.students = snapshot.data!;
                return list();
              }
              return Text('Não tem conteúdo');
          }
          return Text('Erro', style: TextStyle(fontSize: 30));
        },
      ),
    );
  }

  list() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(this.students[index]))),
          trailing: Text(this.students[index].wand.core,
              style: TextStyle(fontSize: 20)),
          title: Text(
            this.students[index].name,
            style: TextStyle(fontSize: 20),
          ),
          leading: Card(
            child: FadeInImage.assetNetwork(
                image: students[index].path,
                placeholder: 'assets/loading.gif',
                imageErrorBuilder: (context, imageErrorBuilder, error) {
                  return Image.asset('assets/flutter.png');
                }),
          ),
        );
      },
    );
  }
}

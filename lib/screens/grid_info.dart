import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/screens/details.dart';
import 'package:flutter_application_1/service/api.dart';
import 'package:flutter_application_1/utils/load_image.dart';

class GridInfo extends StatefulWidget {
  @override
  _GridInfoState createState() => _GridInfoState();
}

class _GridInfoState extends State<GridInfo> {
  List<Student> students = [];
  final api = Api();

  final style = TextStyle(fontSize: 18, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
          actions: [
            IconButton(
              onPressed: () async {
                students = await api.readJson();
                setState(() {});
              },
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Card(
                  elevation: 20,
                  child: Image.network(
                    this.students[index].path,
                    errorBuilder: (_c, _o, _s) =>
                        Image.asset('assets/flutter.png'),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator();
                    },
                  ),
                ),
                title: Text(this.students[index].name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(this.students[index]),
                    ),
                  );
                },
              );
            }));
  }
}

//loadNetworkImage(this.students[index].path),

                  

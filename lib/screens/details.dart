import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';

class Details extends StatelessWidget {
  Details(
    this.student,
  );

  final Student student;

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(
                this.student.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            // Container(
            //   height: height * 0.4,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/imageName'),
            //     ),
            //   ),
            // ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: this.student.path,
              imageErrorBuilder: (context, imageErrorBuilder, error) {
                return Image.asset('assets/flutter.png');
              },
              fadeInCurve: Curves.easeOut,
            ),
            Center(
              child: Text(
                this.student.wand.core,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Voltar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

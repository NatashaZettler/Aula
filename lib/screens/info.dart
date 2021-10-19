import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/grid_info2.dart';

class Info extends StatelessWidget {
  const Info();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/marvel.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'MARVEL',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.13),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridInfo2()),
                );
              },
              child: Text('MARVEL'), //Icon(Icons.arrow_back_outlined),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.20,
            ),
          ],
        ),
      ),
    );
  }
}

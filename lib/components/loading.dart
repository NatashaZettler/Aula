import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.green,
              color: Colors.red,
              strokeWidth: 10,
            ),
            Text(
              'Dados estão sendo carregados ...',
              maxLines: 1,
              style: TextStyle(fontSize: 20),
            )
          ]),
    );
  }
}

import 'package:flutter/material.dart';

//void main() => runApp(SnackBarGeneric());

class SnackBarGeneric extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SnackBar(
          content: Text(''),
        ),
      ),
    );
  }

  Widget showSnack(String message) {
    return MaterialApp(
      home: Scaffold(
        body: SnackBar(
          content: Text(message),
        ),
      ),
    );

  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'SSCC Talk',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}

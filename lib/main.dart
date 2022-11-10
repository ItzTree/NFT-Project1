import 'package:flutter/material.dart';

import 'package:sscc_talk/login_page.dart';

var sscctalkPrimaryColor = Color(0xffc8c8c8);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

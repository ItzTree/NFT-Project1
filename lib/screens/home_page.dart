import 'package:flutter/material.dart';
import 'package:sscc_talk/data/color_palette.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'S S C C   T A L K',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: sscctalkPrimaryColor,
      ),
      backgroundColor: Colors.white,

      /// Home Page
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}

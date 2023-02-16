import 'package:flutter/material.dart';

class WriteNoticePage extends StatelessWidget {
  const WriteNoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "글 쓰 기",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text("Write Notice Page"),
      ),
    );
  }
}

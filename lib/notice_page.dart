import 'package:flutter/material.dart';
import 'main.dart';
// import 'main_body.dart';
import 'setting_page.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'SSCC Talk',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: sscctalkPrimaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingPage()),
              );
            }),
          ),
        ],
      ),
      body: Center(
        child: Text("Notice Page"),
      ),
    );
  }
}

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
      home: changeInfoPage(),
    );
  }
}

class changeInfoPage extends StatefulWidget {
  const changeInfoPage({super.key});

  @override
  State<changeInfoPage> createState() => _changeInfoPageState();
}

class _changeInfoPageState extends State<changeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "정보변경",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text("ID"),
            subtitle: Text("Original ID"), //현재
            onTap: () {
              print("change ID");
            },
            //바꿀 아이디 바로 적도록?
          ),
          ListTile(
            title: Text("NickName"),
            subtitle: Text("Original Nickname"), //현재
            onTap: () {},
            //바꿀 닉네임 바로 적을 수 있게 팝업 띄우기?
          ),
          ListTile(
            title: Text("Password"),
            subtitle: Text("Original Password"),
            onTap: () {},
            //현재 비밀번호 표시???
            //바꿀 비밀번호 설정
          ),
        ],
      ),
    );
  }
}

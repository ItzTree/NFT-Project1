import 'package:flutter/material.dart';

class ChangeInfoPage extends StatefulWidget {
  const ChangeInfoPage({super.key});

  @override
  State<ChangeInfoPage> createState() => _ChangeInfoPageState();
}

class _ChangeInfoPageState extends State<ChangeInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black), // 뒤로 가기
        elevation: 1,
        title: Text(
          "정 보 변 경",
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
          /// 아이디 표시
          ListTile(
            title: Text("ID"),
            subtitle: Text("ssccTalk123"), // 로그인한 아이디
            onTap: () {},
          ),

          /// 닉네임 변경
          ListTile(
            title: Text("닉네임"),
            subtitle: Text("닉네임 변경하기"),
            onTap: () {
              // 닉네임 변경 팝업
            },
          ),

          /// 비밀번호 변경
          ListTile(
            title: Text("비밀번호"),
            subtitle: Text("비밀번호 변경하기"),
            onTap: () {
              // 비밀번호 변경 팝업
            },
          ),
        ],
      ),
    );
  }
}

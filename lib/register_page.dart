import 'package:flutter/material.dart';

import 'main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var idRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();
  var againPasswordRegisterController = TextEditingController();
  var nicknameRegisterController = TextEditingController();
  var emailRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// ID
    var idRegisterTextField = TextField(
      controller: idRegisterController,
      decoration: InputDecoration(
        labelText: 'ID',
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // 클릭 시 밑줄 색
        ),
      ),
      cursorColor: Colors.black,
    );

    /// 비밀번호
    var passwordRegisterTextField = TextField(
      controller: passwordRegisterController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
    );

    /// 비밀번호 확인
    var againPasswordRegisterTextField = TextField(
      controller: againPasswordRegisterController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password Again',
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
    );

    /// 닉네임
    var nicknameRegisterTextField = TextField(
      controller: nicknameRegisterController,
      decoration: InputDecoration(
        labelText: 'Nickname',
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
    );

    /// 이메일
    var emailRegisterTextField = TextField(
      controller: emailRegisterController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
    );

    /// 회원가입 버튼
    var registerElevatedButton = SizedBox(
      height: 50,
      width: 240,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: sscctalkPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // 모서리 둥글게
          ),
          elevation: 2,
        ),
        child:
            Text("회원가입", style: TextStyle(fontSize: 24, color: Colors.black)),
        onPressed: () {
          CustomSnackBar().showSnackBar(context); // 회원가입 성공!
          Navigator.pop(context);
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원가입",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black), // 뒤로 가기
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              "SSCC TALK",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            idRegisterTextField,
            SizedBox(height: 8),
            passwordRegisterTextField,
            SizedBox(height: 8),
            againPasswordRegisterTextField,
            SizedBox(height: 8),
            nicknameRegisterTextField,
            SizedBox(height: 8),
            emailRegisterTextField,
            SizedBox(height: 48),
            registerElevatedButton,
          ],
        ),
      ),
    );
  }
}

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key});

  final successColor = const Color(0xFFA6FBA6);

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle_outline, color: successColor),
          SizedBox(width: 10),
          Text("회원가입 성공!", style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: sscctalkPrimaryColor, width: 3),
      ),
      margin: EdgeInsets.fromLTRB(100, 0, 100, 30),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';

import 'main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController idRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController againPasswordRegisterController =
      TextEditingController();
  TextEditingController nicknameRegisterController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();

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
          borderSide: BorderSide(color: Colors.black),
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

    // 회원가입 버튼
    var registerElevatedButton = SizedBox(
      height: 50,
      width: 240,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: sscctalkPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child:
            Text("회원가입", style: TextStyle(fontSize: 24, color: Colors.black)),
        onPressed: () {
          print("회원가입 버튼 누름");
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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

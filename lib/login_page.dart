import 'package:flutter/material.dart';

import 'main.dart';
import 'register_page.dart';
import 'main_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var idController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// SSCC
    var ssccText = Text(
      "SSCC",
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    );

    /// ID
    var idTextField = TextField(
      controller: idController,
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
    var passwordTextField = TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      cursorColor: Colors.black,
    );

    /// 로그인 버튼
    var loginElevatedButton = SizedBox(
      width: 240,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: sscctalkPrimaryColor,
          shape: RoundedRectangleBorder(
            // 모서리가 둥글게
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: Text("로그인", style: TextStyle(fontSize: 21, color: Colors.black)),
        onPressed: () {
          // 로그인 버튼 누르면 메인 페이지로 이동
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => MainBody()),
          );
        },
      ),
    );

    /// 회원가입 버튼
    var shiftToRegisterTextButton = TextButton(
      style: ButtonStyle(
        overlayColor: // 클릭 시 배경 색
            MaterialStateColor.resolveWith((states) => Colors.black12),
      ),
      child: Text(
        "회원가입",
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      onPressed: () {
        // 회원가입 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            ssccText,
            SizedBox(height: 32),
            idTextField,
            SizedBox(height: 8),
            passwordTextField,
            SizedBox(height: 32),
            Column(
              children: [
                loginElevatedButton,
                shiftToRegisterTextButton,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

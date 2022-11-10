import 'package:flutter/material.dart';

import 'package:sscc_talk/main.dart';
import 'package:sscc_talk/register_page.dart';
import 'package:sscc_talk/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          borderSide: BorderSide(color: Colors.black),
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
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: Text("로그인", style: TextStyle(fontSize: 21, color: Colors.black)),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
          );
        },
      ),
    );

    /// 회원가입 버튼 샘플 (수평)
    var shiftToRegisterElevatedButtonInHorizontal = SizedBox(
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: sscctalkPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child:
            Text("회원가입", style: TextStyle(fontSize: 21, color: Colors.black)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
          );
        },
      ),
    );

    /// 회원가입 버튼 샘플 (수직)
    var shiftToRegisterTextButtonInVertical = TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.black12),
      ),
      child: Text(
        "회원가입",
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
    );

    // DEBUG: horizontal / vertical
    bool isHorizontal = false;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          children: [
            if (isHorizontal)
              SizedBox(height: MediaQuery.of(context).size.height * 0.3)
            else
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            ssccText,
            SizedBox(height: 32),
            idTextField,
            SizedBox(height: 8),
            passwordTextField,
            SizedBox(height: 32),
            // 수평
            if (isHorizontal)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginElevatedButton,
                  SizedBox(width: 16),
                  shiftToRegisterElevatedButtonInHorizontal,
                ],
              )
            // 수직
            else
              Column(
                children: [
                  loginElevatedButton,
                  shiftToRegisterTextButtonInVertical,
                ],
              ),
          ],
        ),
      ),
    );
  }
}

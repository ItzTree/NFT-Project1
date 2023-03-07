import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sscc_talk/custom_snackbar.dart';
import 'package:sscc_talk/services/auth_service.dart';

import '../data/color_palette.dart';

import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    /// SSCC
    var ssccText = Text(
      "SSCC",
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
    );

    /// email
    var emailTextField = TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
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
    var loginElevatedButton = Consumer<AuthService>(
      builder: (context, authService, child) {
        return SizedBox(
          width: screenWidth * 0.55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: sscctalkPrimaryColorLight,
              shape: RoundedRectangleBorder(
                // 모서리가 둥글게
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 2,
            ),
            child: Text("로그인",
                style: TextStyle(fontSize: 21, color: Colors.black)),
            onPressed: () {
              // 로그인 버튼 누르면 메인 페이지로 이동
              authService.signIn(
                email: emailController.text,
                password: passwordController.text,
                onSuccess: () {
                  // 로그인 성공
                  CustomSnackBar(
                    snackBarText: "로그인 성공",
                  ).showSnackBar(context);
                  Navigator.of(context).pushReplacementNamed('/main');
                },
                onError: (err) {
                  CustomSnackBar(
                    snackBarText: "에러: $err",
                  ).showSnackBar(context);
                },
              );
            },
          ),
        );
      },
    );

    /// 회원가입 버튼
    var shiftToRegisterTextButton = TextButton(
      style: ButtonStyle(
        overlayColor: // 클릭 시 배경 색
            MaterialStateColor.resolveWith(
                (states) => sscctalkPrimaryColorLight),
      ),
      child: Text(
        "회원가입",
        style: TextStyle(fontSize: 14, color: sscctalkPrimaryColorDark),
      ),
      onPressed: () {
        // 회원가입 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
    );

    return Consumer<AuthService>(
      builder: (context, authService, child) {
        final user = authService.currentUser();

        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.25),
                ssccText,
                SizedBox(height: 32),
                emailTextField,
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
      },
    );
  }
}

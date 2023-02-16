import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_snackbar.dart';
import '../services/auth_service.dart';
import '../data/color_palette.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailRegisterController = TextEditingController();
  var passwordRegisterController = TextEditingController();
  var againPasswordRegisterController = TextEditingController();
  var nicknameRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

    /// 회원가입 버튼
    var registerElevatedButton =
        Consumer<AuthService>(builder: (context, authService, child) {
      return SizedBox(
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
            authService.signUp(
              email: emailRegisterController.text,
              password: passwordRegisterController.text,
              onSuccess: () {
                CustomSnackBar(
                  snackBarText: "회원가입 성공",
                ).showSnackBar(context);
                Navigator.of(context).pop();
              },
              onError: (err) {
                CustomSnackBar(
                  snackBarText: "에러: $err",
                ).showSnackBar(context);
              },
            );
            // CustomSnackBar().showSnackBar(context); // 회원가입 성공!
            // Navigator.pop(context);
          },
        ),
      );
    });

    return Consumer<AuthService>(
      builder: (context, authService, child) {
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
                emailRegisterTextField,
                SizedBox(height: 8),
                passwordRegisterTextField,
                SizedBox(height: 8),
                againPasswordRegisterTextField,
                SizedBox(height: 8),
                nicknameRegisterTextField,
                SizedBox(height: 48),
                registerElevatedButton,
              ],
            ),
          ),
        );
      },
    );
  }
}

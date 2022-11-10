import 'package:flutter/material.dart';

var sscctalkPrimaryColor = Color(0xffc8c8c8);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

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
      width: 120,
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

    /// 회원가입 버튼
    var registerElevatedButtonInHorizontal = SizedBox(
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
          print("회원가입 버튼 클릭됨");
        },
      ),
    );

    var registerTextButtonInVertical = TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateColor.resolveWith((states) => Colors.black12),
      ),
      child: Text(
        "회원가입",
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      onPressed: () {
        print("회원가입 버튼 클릭됨");
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
            loginElevatedButton,
            registerTextButtonInVertical,
          ],
        ),
      ),
    );
  }
}

/// 메인 페이지
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SSCC Talk',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            label: '공지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_outlined),
            label: '게시판',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정',
          ),
        ],
      ),
    );
  }
}

/// 공지
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("First Page"),
      ),
    );
  }
}

/// 게시판
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Second Page"),
      ),
    );
  }
}

/// 설정
class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Third Page"),
      ),
    );
  }
}

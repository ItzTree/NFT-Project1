import 'package:flutter/material.dart';
import 'package:sscc_talk/main.dart';

import 'changeInfo.dart';
import 'login_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "SSCC TALK",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 62,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "nickname님", //$nickname 님
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 32),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                title: Text("로그아웃"),
              ),
              ListTile(
                onTap: () {
                  _showdialog(context);
                },
                title: Text("회원탈퇴"),
              ),
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const myPostPage()),
                  // );
                },
                title: Text("내가쓴글"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const changeInfoPage(),
                    ),
                  );
                },
                title: Text("정보변경"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> _showdialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('Warning!'),
      content: Text("정말 탈퇴하시겠어요?"),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
            sscctalkPrimaryColor,
          )),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            '네',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
            sscctalkPrimaryColor,
          )),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            '아니오',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

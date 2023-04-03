import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sscc_talk/services/auth_service.dart';

import '../change_info.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      final user = authService.currentUser();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black), // 뒤로 가기
          title: Text(
            "환 경 설 정",
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
                /// 닉네임 표시
                Text(
                  "${user?.displayName} 님", // $nickname 님
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 32),

                /// 로그아웃
                ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                    authService.signOut();
                  },
                  title: Text("로그아웃"),
                ),

                /// 회원탈퇴
                ListTile(
                  onTap: () {
                    dialogWithdraw(context);
                  },
                  title: Text("회원탈퇴"),
                ),

                /// 내가 쓴 글
                // ListTile(
                //   onTap: () {},
                //   title: Text("내가쓴글"),
                // ),

                /// 정보 변경
                // ListTile(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const ChangeInfoPage(),
                //       ),
                //     );
                //   },
                //   title: Text("정보변경"),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

Future<dynamic> dialogWithdraw(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        '회원탈퇴',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text("정말 탈퇴하시겠어요?"),
      actions: [
        /// 네
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          onPressed: () {
            // do withdraw
            Navigator.of(context).pop();
          },
          child: Text(
            '네',
            style: TextStyle(
              fontSize: 15,
              color: Colors.red,
            ),
          ),
        ),

        /// 아니오
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            '아니오',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}

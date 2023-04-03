import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../data/color_palette.dart';

import 'post_page.dart';
// import 'home_page.dart';
import 'notice_page.dart';
import 'setting_page.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int _selectedIndex = 0; // 페이지 번호

  final List<Widget> _pageList = <Widget>[
    // 페이지 리스트
    // HomePage(),
    NoticePage(),
    PostPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList.elementAt(_selectedIndex), // 출력되는 페이지 결정

      /// bottomNavigationBar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: GNav(
          activeColor: sscctalkPrimaryColor,
          color: Colors.black,
          tabBackgroundColor: sscctalkPrimaryColorLight.withOpacity(0.8),
          tabActiveBorder: Border.all(color: sscctalkPrimaryColor, width: 1),
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          gap: 8,
          iconSize: 28,
          tabs: [
            // GButton(
            //   icon: _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            //   text: "메 인",
            // ),
            GButton(
              icon: _selectedIndex == 0
                  ? Icons.campaign
                  : Icons.campaign_outlined,
              text: "공 지",
              iconSize: 32,
            ),
            GButton(
              icon: _selectedIndex == 1
                  ? Icons.question_answer
                  : Icons.question_answer_outlined,
              text: "자 유",
            ),
            GButton(
              icon: _selectedIndex == 2
                  ? Icons.settings
                  : Icons.settings_outlined,
              text: "설 정",
            ),
          ],
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

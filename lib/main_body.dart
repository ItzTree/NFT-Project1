import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:sscc_talk/notice_page.dart';
import 'package:sscc_talk/post_page.dart';
import 'package:sscc_talk/home_page.dart';
import 'package:sscc_talk/setting_page.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int currentIndex = 1;

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
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingPage()),
              );
            }),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          NoticePage(),
          HomePage(),
          PostPage(),
        ],
      ),
      bottomNavigationBar: customBottomNavBar(),
    );
  }

  ConvexAppBar customBottomNavBar() {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: Colors.black45,
      initialActiveIndex: currentIndex,
      items: [
        TabItem(
          icon: Icon(Icons.announcement_outlined, color: Colors.white60),
          activeIcon: Icon(Icons.announcement_outlined, color: Colors.white),
          title: "공지",
        ),
        TabItem(
          icon: Icon(Icons.house, size: 36, color: Colors.black26),
          activeIcon: Icon(Icons.house, size: 36, color: Colors.black45),
        ),
        TabItem(
          icon: Icon(Icons.question_answer_outlined, color: Colors.white60),
          activeIcon: Icon(Icons.question_answer_outlined, color: Colors.white),
          title: "게시판",
        ),
      ],
      onTap: (newIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      },
    );
  }
}

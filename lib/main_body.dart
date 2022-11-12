import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'post_page.dart';
import 'home_page.dart';
import 'main.dart';
import 'notice_page.dart';

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
      // appBar: AppBar(
      //   title: Text(
      //     'SSCC Talk',
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: sscctalkPrimaryColor,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.settings),
      //       color: Colors.black,
      //       onPressed: (() {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (_) => SettingPage()),
      //         );
      //       }),
      //     ),
      //   ],
      // ),
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
      backgroundColor: sscctalkPrimaryColor,
      initialActiveIndex: currentIndex,
      items: [
        TabItem(
          icon: Icon(Icons.announcement_outlined, color: Colors.black),
          activeIcon: Icon(Icons.announcement_outlined, color: Colors.black),
        ),
        TabItem(
          icon: Icon(Icons.house, size: 36),
        ),
        TabItem(
          icon: Icon(Icons.question_answer_outlined, color: Colors.black),
          activeIcon: Icon(Icons.question_answer_outlined, color: Colors.black),
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

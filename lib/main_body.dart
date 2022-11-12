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
          icon: Icon(Icons.announcement_outlined, color: Colors.black38),
        ),
        TabItem(
          icon: Icon(Icons.house, size: 36),
        ),
        TabItem(
          icon: Icon(Icons.question_answer_outlined, color: Colors.black38),
        ),
      ],
      onTap: (newIndex) {
        setState(
          () {
            if (newIndex == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => NoticePage()));
            } else if (newIndex == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => PostPage()));
            }
          },
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sscc_talk/setting_page.dart';

import 'main.dart';
import 'mainbody.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MainBody()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'SSCC Talk',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: sscctalkPrimaryColor,
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Feed();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("클릭 되었습니다.!");
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.create,
          color: Colors.grey,
        ),
      ),
    );
  }
}

/// 피드 클래스
class Feed extends StatefulWidget {
  const Feed({
    Key? key,
  }) : super(key: key);

  // 이미지를 담을 변수    아래가 private한 클래스여서!
  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isFavorite = false; // 좋아요 여부

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 제목
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "제목",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// 설명
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My cat is docile even when bathed. I put a duck on his head in the wick and he's staring at me. Isn't it so cute??",
            ),
          ),

          /// 날짜
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "FEBURARY 6",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart,
                  color: isFavorite ? Colors.pink : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    // build가 다시 호출된다.
                    isFavorite = !isFavorite;
                  });
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(CupertinoIcons.bookmark, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

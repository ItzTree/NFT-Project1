// import 'package:flutter/material.dart';

// class PostPage extends StatelessWidget {
//   const PostPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Post Page"),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/color_palette.dart';

/*
- 데이터베이스와 연동하기
- 글을 쓰면 내용이 데이터베이스에 올라가고 목록으로 돌아오기
*/

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  final List<Map<String, dynamic>> posts = const [
    // Map 자료형 post 선언!!
    {
      'title': "NFT 팀 동방 사용",
      'content': "내일 11시~16시 동아리 프로젝트 진행하겠습니다. 동방 사용에 참고해주세요!!",
      'date': '2022/11/11 20:01',
    },
    {
      'title': "12/11까지 30일동안 DailyBOJ 같이 하실 분~",
      'content': "문제 난이도와 상관없이 하루 한 문제 푸는 것을 목표로 합니다. 과심잇으신 분은 연락주세요~",
      'date': '2022/11/11 17:14',
    },
    {
      'title': "동방에 계신 분!",
      'content': "지금 동방에 계신 분 연락 한번만 부탁드립니다!!!",
      'date': '2022/11/05 18:05',
    },
    {
      'title': "RSA 스터디 동방 사용",
      'content': "오늘 8시 이후로 동방에서 RSA 스터디를 진행할 예정입니다. 동방 사용에 참고해주세요~",
      'date': '2022/11/02 12:49',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "자 유 게 시 판",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: sscctalkPrimaryColor,
        elevation: 2,

        /// 글 쓰기 버튼
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/notice/write_notice');
            },
            icon: Icon(Icons.edit),
            color: Colors.black,
            iconSize: 32,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          final title = post['title'] ?? "Title";
          final content = post['content'] ?? "Content";
          final date = post['date'] ?? "2000/01/01 00:00";
          return NoticeBox(title: title, content: content, date: date);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

class NoticeBox extends StatefulWidget {
  const NoticeBox({
    //생성자(title, content, date) 3가지 초기화
    Key? key,
    required this.title,
    required this.content,
    required this.date,
  }) : super(key: key);

  final String title;
  final String content;
  final String date;

  @override
  State<NoticeBox> createState() => _NoticeBoxState();
}

class _NoticeBoxState extends State<NoticeBox> {
  bool isChecked = false; //필드: 체크표시

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 25,
          0), //padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16), fromLTRB(25, 10, 25, 0)
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(widget.content),
          Text(
            widget.date,
            style: TextStyle(color: Colors.grey),
          ),

          //아이콘들
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart,
                  color: isChecked ? Colors.pink : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    //build가 다시 호출된다.
                    isChecked = !isChecked;
                  });
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(CupertinoIcons.delete, color: Colors.black),
                onPressed: () {
                  deletePost(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 삭제 확인 함수
Future<dynamic> deletePost(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(
        "정말 삭제 하시겠어요?",
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        /// 네
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            elevation: MaterialStateProperty.all<double>(0),
          ),
          onPressed: () => Navigator.of(context).pop(),
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

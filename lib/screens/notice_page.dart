import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/color_palette.dart';

/*
- 데이터베이스와 연동하기
- 글을 쓰면 내용이 데이터베이스에 올라가고 목록으로 돌아오기
*/

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  final List<Map<String, dynamic>> posts = const [
    // Map 자료형 post 선언!!
    {
      'title': "SSCC 홈커밍 안내",
      'content': "SSCC 홈커밍이 찾아왔습니다! \n1부 - 2022 해커톤 발표평가회 / 15시 30분",
      'date': '2022/11/03 22:12',
    },
    {
      'title': "SSCC 번개모임 안내",
      'content': "일시: 11/9 수요일 18시 \n장소: 추후 공지 예정",
      'date': '2022/11/03 11:15',
    },
    {
      'title': "해커톤 신청 기한 연장 공지",
      'content': "기존 신청 기한: 10/31 23:59 -> 11/1 23:59",
      'date': '2022/10/31 23:42',
    },
    {
      'title': "[C++ 단기 속성 강좌 스터디 안내]",
      'content':
          "안녕하세요 여러분 AI융햡학부 김민규와 C++단기 속성 강좌 스터디를 함께 하실 분들을 모집합니다. 많은 참여 바랍니다.",
      'date': '2022/10/31 15:44',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "공 지 사 항",
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
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.checkmark,
                  color: isChecked ? Colors.blue : Colors.black,
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

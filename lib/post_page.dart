import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comment_popup.dart';
import 'main.dart';
import 'main_body.dart';
import 'mainbody.dart';
import 'setting_page.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> textms = [
      "12/11까지 30일동안 DailyBOJ 같이 하실 분~",
      "NFT 팀 동방 사용",
      "RSA 스터디 동방 사용",
      "[긴급!!]"
    ];
    final List<String> textms2 = [
      "문제 난이도와 상관없이 하루 한 문제 푸는 것을 목표로 합니다. 과심잇으신 분은 연락주세요~",
      "내일 11시 16시 동아리 프로젝트 진행하겠습니다. 동방 사용에 참고해주세요!!",
      "오늘 8시 이후로 동방에서 RSA 스터디를 진행할 예정입니다. 동방 사용에 참고해주세요~",
      "지금 동방에 계신 분 연락 한번만 부탁드립니다!!!"
    ];

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
          '게시판',
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
        itemCount: textms.length,
        itemBuilder: (context, index) {
          String textm = textms[index];
          String textm2 = textms2[index];
          return Feed(txtmessage: textm, txtmessage2: textm2);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Messagetext()),
          );
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
    required this.txtmessage,
    required this.txtmessage2,
  }) : super(key: key);

  final String txtmessage;
  final String txtmessage2;

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
              widget.txtmessage,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// 설명
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.txtmessage2,
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CommentUI();
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
          Divider()
        ],
      ),
    );
  }
}

//글쓰기 화면
class Messagetext extends StatelessWidget {
  const Messagetext({Key? key}) : super(key: key);

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
        //actionsIconTheme:
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
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "글쓰기",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 15),
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                height: 65,
                width: 500,
                child: SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    obscureText: false,
                    decoration: InputDecoration(
                        hintText: "제목",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
              ),
              Container(
                height: 150,
                width: 500,
                child: SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "내용",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              //   title: Text("작성"),
              // ),
              SizedBox(height: 200),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      child: Text("작성"))
                ],
              ),
              // Container(
              //   width: 100,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Text("작성"),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> deletePost(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text("정말 삭제 하시겠어요?"),
      actions: [
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

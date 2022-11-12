import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sscc_talk/setting_page.dart';

import 'comment_popup.dart';
import 'main.dart';
import 'main_body.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> textms = [
      "SSCC 홈커밍 안내",
      "SSCC 번개모임 안내",
      "해커톤 신청 기한 연장 공지",
      "[C++ 단기 속성 강좌 스터디 안내]"
    ];
    final List<String> textms2 = [
      "SSCC 홈커밍이 찾아왔습니다! \n1부 - 2022 해커톤 발표평가회 / 15시 30분",
      "일시: 11/9 수요일 18시 \n장소: 추후 공지 예정",
      "기존 신청 기한: 10/31 23:59 -> 11/1 23:59",
      "안녕하세요 여러분 AI유압학부 김민규와 C++단기 속성 강좌 스터디를 함께 하실 분들을 모집합니다. 많은 참여 바랍니다."
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
          '공지 사항',
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
            //아이콘들
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

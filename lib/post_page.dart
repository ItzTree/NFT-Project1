import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'comment_popup.dart';
import 'main.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          '자 유 게 시 판',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: sscctalkPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Feed();
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'postFAB',
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
                  fontSize: 28,
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
                height: 120,
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
              //SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: sscctalkPrimaryColor, elevation: 0),
                      child: Text(
                        "작성하기",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              )
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

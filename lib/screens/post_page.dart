import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/color_palette.dart';

import '../screens/notice_page.dart';

import '../services/auth_service.dart';
import '../services/post_service.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    return Consumer<PostService>(
      builder: (context, postService, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "자 유 게 시 판",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: sscctalkPrimaryColor,
            elevation: 2,

            /// 글 쓰기 버튼
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/post/write_post');
                },
                icon: Icon(Icons.edit),
                color: Colors.white,
                iconSize: 32,
              ),
            ],
          ),

          // 자유게시판 목록
          body: FutureBuilder<QuerySnapshot>(
            future: postService.read(),
            builder: (context, snapshot) {
              final posts = snapshot.data?.docs ?? [];
              return ListView.separated(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  String title = post.get('title');
                  String content = post.get('content');

                  String date = post.get('date');
                  String uid = post.get('uid');

                  return PostBox(
                    //게시글 글상자(제목+내용,체크 버튼과 삭제버튼)
                    title: title,
                    content: content,
                    date: date,
                    postService: postService,
                    postId: post.id,
                    uid: uid,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            },
          ),
        );
      },
    );
  }
}

class PostBox extends StatefulWidget {
  const PostBox({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.postService,
    required this.postId,
    required this.uid,
  }) : super(key: key);

  final String title;
  final String content;
  final String date;
  final PostService postService;
  final String postId;
  final String uid;

  @override
  State<PostBox> createState() => _PostBoxState();
}

class _PostBoxState extends State<PostBox> {
  late SharedPreferences _prefs;
  bool _isLiked = false; // 필드: 체크표시

  @override
  void initState() {
    super.initState();
    _loadCheckedState();
  }

  Future<void> _loadCheckedState() async {
    _prefs = await SharedPreferences.getInstance();
    final isLiked = _prefs.getBool(widget.postId) ?? false;
    setState(() {
      _isLiked = isLiked;
    });
  }

  void _updateLikedState(bool isLiked) {
    _prefs.setBool(widget.postId, isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 25, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 제목
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          /// 내용
          Text(widget.content),

          /// 날짜
          Text(
            widget.date,
            style: TextStyle(color: Colors.grey),
          ),

          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart,
                  color: _isLiked ? Colors.pink : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                  _updateLikedState(_isLiked);
                },
              ),
              Spacer(),

              /// 삭제 버튼
              if (user.uid == widget.uid)
                IconButton(
                  icon: Icon(CupertinoIcons.delete, color: Colors.black),
                  onPressed: () {
                    deletePost(context, widget.postService, widget.postId);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 삭제 확인 함수
Future<dynamic> deletePost(
  BuildContext context,
  PostService postService,
  String postId,
) {
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
          onPressed: (() {
            postService.delete(postId);
            Navigator.of(context).pop();
          }),
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

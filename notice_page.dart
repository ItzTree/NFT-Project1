import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/color_palette.dart';

import '../services/auth_service.dart';
import '../services/notice_service.dart';

late dynamic authService;
late dynamic user;

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    authService = context.read<AuthService>();
    user = authService.currentUser()!;

    return Consumer<NoticeService>(
      builder: (context, noticeService, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "공 지 사 항",
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
                  Navigator.pushNamed(context, '/notice/write_notice');
                },
                icon: Icon(Icons.edit),
                color: Colors.white,
                iconSize: 32,
              ),
            ],
          ),

          /// 공지글 목록
          body: FutureBuilder<QuerySnapshot>(
            future: noticeService.read(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 로딩 중
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final notices = snapshot.data?.docs ?? [];
                return ListView.separated(
                  itemCount: notices.length,
                  itemBuilder: (context, index) {
                    final notice = notices[index];

                    String title = notice.get('title');
                    String content = notice.get('content');
                    String date = notice.get('date');
                    String uid = notice.get('uid');

                    return NoticeBox(
                      // 공지 글상자(제목+내용,체크 버튼과 삭제버튼)
                      title: title,
                      content: content,
                      date: date,
                      noticeService: noticeService,
                      noticeId: notice.id,
                      uid: uid,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}

class NoticeBox extends StatefulWidget {
  const NoticeBox({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.noticeService,
    required this.noticeId,
    required this.uid,
  }) : super(key: key);

  final String title;
  final String content;
  final String date;
  final NoticeService noticeService;
  final String noticeId;
  final String uid;

  @override
  State<NoticeBox> createState() => _NoticeBoxState();
}

class _NoticeBoxState extends State<NoticeBox> {
  late SharedPreferences _prefs; // 게시글마다 체크 상태 저장
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadCheckedState();
  }

  Future<void> _loadCheckedState() async {
    _prefs = await SharedPreferences.getInstance();
    final isChecked = _prefs.getBool(widget.noticeId) ?? false;
    setState(() {
      _isChecked = isChecked;
    });
  }

  void _updateCheckedState(bool isChecked) {
    _prefs.setBool(widget.noticeId, isChecked);
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
              // 체크 표시
              IconButton(
                onPressed: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                  _updateCheckedState(_isChecked);
                },
                icon: Icon(
                  CupertinoIcons.checkmark,
                  color: _isChecked ? Colors.blue : Colors.black,
                ),
              ),

              Spacer(),

              /// 삭제 버튼
              if (user.uid == widget.uid)
                IconButton(
                  icon: Icon(CupertinoIcons.delete, color: Colors.black),
                  onPressed: () {
                    deletePost(context, widget.noticeService, widget.noticeId);
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
  NoticeService noticeService,
  String noticeId,
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
            noticeService.delete(noticeId);
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

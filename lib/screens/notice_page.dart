import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sscc_talk/services/notice_service.dart';
import '../data/color_palette.dart';
import 'package:sscc_talk/services/auth_service.dart';
import '../services/notice_service.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    return Consumer<NoticeService>(
      builder: (context, noticeService, child) {
        return Scaffold(
          appBar: AppBar(
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
              final notices = snapshot.data?.docs ?? [];
              return ListView.separated(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  final notice = notices[index];

                  String title = notice.get('title');
                  String content = notice.get('content');
                  bool isChecked = notice.get('check');
                  String date = notice.get('date');

                  return NoticeBox(
                    title: title,
                    content: content,
                    date: date,
                    noticeService: noticeService,
                    noticeId: notice.id,
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

class NoticeBox extends StatefulWidget {
  const NoticeBox({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.noticeService,
    required this.noticeId,
  }) : super(key: key);

  final String title;
  final String content;
  final String date;
  final NoticeService noticeService;
  final String noticeId;

  @override
  State<NoticeBox> createState() => _NoticeBoxState();
}

class _NoticeBoxState extends State<NoticeBox> {
  final noticeCollection = FirebaseFirestore.instance.collection('notice');
  bool isChecked = false;
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
              /// 체크 표시
              Consumer<NoticeService>(builder: (context, noticeService, _) {
                return IconButton(
                  onPressed: () {
                    isChecked = !isChecked;
                    noticeService.update(widget.noticeId, isChecked);
                  },
                  icon: Icon(
                    CupertinoIcons.checkmark,
                    color: isChecked ? Colors.blue : Colors.black,
                  ),
                );
              }),
              Spacer(),

              /// 삭제 버튼
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

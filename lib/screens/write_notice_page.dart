import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sscc_talk/data/color_palette.dart';
import 'package:sscc_talk/services/notice_service.dart';

import '../services/auth_service.dart';

class WriteNoticePage extends StatefulWidget {
  const WriteNoticePage({super.key});

  @override
  State<WriteNoticePage> createState() => _WriteNoticePageState();
}

class _WriteNoticePageState extends State<WriteNoticePage> {
  bool isChecked = false;

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    return Consumer<NoticeService>(builder: (context, noticeService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "글 쓰 기",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: sscctalkPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 제목
                SizedBox(
                  height: 65,
                  width: 500,
                  child: TextField(
                    controller: titleController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    obscureText: false,
                    maxLength: 30,
                    decoration: InputDecoration(
                        hintText: "제목",
                        counterText: '',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),

                /// 내용
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: contentController,
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
                SizedBox(height: 10),

                /// 중요도 체크와 작성버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// 중요 체크 버튼
                    IconButton(
                      icon: Icon(
                        Icons.check,
                        color: isChecked ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),

                    /// 작성하기
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (titleController.text.isNotEmpty &&
                              contentController.text.isNotEmpty) {
                            noticeService.create(
                              titleController.text,
                              contentController.text,
                              isChecked,
                              user.uid,
                            );
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: sscctalkPrimaryColor,
                            elevation: 0),
                        child: Text(
                          "작성하기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

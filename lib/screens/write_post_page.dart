import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/color_palette.dart';
import '../services/post_service.dart';
import '../services/auth_service.dart';

class WritePostPage extends StatefulWidget {
  const WritePostPage({super.key});

  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
  bool isLiked = false;

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    final user = authService.currentUser()!;

    return Consumer<PostService>(builder: (context, postService, child) {
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
                  width: double.infinity,
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
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
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
                SizedBox(height: 40),

                /// 작성하기
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // 현재 시간 (한국 기준)
                        var localTime =
                            DateTime.now().toUtc().add(Duration(hours: 9));
                        var currentTime =
                            DateFormat('yyyy/MM/dd HH:mm').format(localTime);

                        if (titleController.text.isNotEmpty &&
                            contentController.text.isNotEmpty) {
                          postService.create(
                            titleController.text,
                            contentController.text,
                            isLiked,
                            user.uid,
                            currentTime,
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: sscctalkPrimaryColor, elevation: 0),
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

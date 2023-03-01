import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sscc_talk/data/color_palette.dart';

class WriteNoticePage extends StatefulWidget {
  const WriteNoticePage({super.key});

  @override
  State<WriteNoticePage> createState() => _WriteNoticePageState();
}

class _WriteNoticePageState extends State<WriteNoticePage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "글 쓰 기",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: sscctalkPrimaryColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "글쓰기",
              //   style: TextStyle(
              //     fontWeight: FontWeight.w900,
              //     fontSize: 28,
              //   ),
              // ),
              SizedBox(height: 15),

              /// 제목
              SizedBox(
                height: 65,
                width: 500,
                child: TextField(
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

              //중요도 체크와 작성버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.checkmark,
                      color: isChecked ? Colors.red : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        //build가 다시 호출된다.
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: sscctalkPrimaryColor, elevation: 0),
                      child: Text(
                        "작성하기",
                        style: TextStyle(
                          color: Colors.black,
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
  }
}

import 'package:flutter/material.dart';

import 'data/color_palette.dart';

class CommentUI extends StatelessWidget {
  const CommentUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.white,

      /// 댓글 제목
      title: Column(
        children: <Widget>[
          Text("댓글"),
        ],
      ),

      /// 댓글 내용 작성
      content: TextField(
        decoration: InputDecoration(
          hintText: '댓글을 작성하세요',
          labelStyle: TextStyle(color: sscctalkPrimaryColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: sscctalkPrimaryColor),
          ),
        ),
        cursorColor: Colors.black,
      ),
      actions: <Widget>[
        /// 취소
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, elevation: 0),
          child: Text(
            '취소',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),

        /// 작성하기
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, elevation: 0),
          child: Text(
            '작성',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

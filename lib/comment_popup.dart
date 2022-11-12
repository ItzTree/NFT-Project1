import 'package:flutter/material.dart';

import 'main.dart';

class CommentUI extends StatelessWidget {
  CommentUI({Key? key}) : super(key: key);

  @override
  var comment = TextField(
    decoration: InputDecoration(
      labelText: 'Writing a comment',
      labelStyle: TextStyle(color: sscctalkPrimaryColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: sscctalkPrimaryColor),
      ),
    ),
    cursorColor: Colors.black,
  );
  Widget build(BuildContext context) {
    return AlertDialog(
      // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.white,
      //Dialog Main Title
      title: Column(
        children: <Widget>[
          Text("댓글"),
        ],
      ),
      //
      content: comment,
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
          child: Text(
            'OK',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

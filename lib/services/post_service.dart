import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostService extends ChangeNotifier {
  final postCollection = FirebaseFirestore.instance.collection('post');

  Future<QuerySnapshot> read() async {
    // 자유게시판 글 가져오기
    return postCollection.get();
  }

  void create(String title, String content, bool check, String uid) async {
    // 공지사항 글 작성하기
    await postCollection.add({
      'uid': uid,
      'title': title,
      'content': content,
      'check': check,
      'date': "2023/01/01 12:34",
    });
    notifyListeners();
  }

  void update(String docId, bool isDone) async {
    // 확인 표시 갱신
  }

  void delete(String docId) async {
    // 공지사항 글 삭제
    await postCollection.doc(docId).delete();
    notifyListeners();
  }
}

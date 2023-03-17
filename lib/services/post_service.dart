import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostService extends ChangeNotifier {
  final postCollection = FirebaseFirestore.instance.collection('post');

  Future<QuerySnapshot> read() async {
    // 자유게시판 글 가져오기
    return postCollection.orderBy('date', descending: true).get();
  }

  void create(
      String title, String content, bool like, String uid, String date) async {
    // 공지사항 글 작성하기
    await postCollection.add({
      'uid': uid,
      'title': title,
      'content': content,
      'like': like,
      'date': date,
    });
    notifyListeners();
  }

  void update(String docId, bool isLiked) async {
    // 확인 표시 갱신
    await postCollection.doc(docId).update({'like': isLiked});
    notifyListeners();
  }

  void delete(String docId) async {
    // 공지사항 글 삭제
    await postCollection.doc(docId).delete();
    notifyListeners();
  }
}

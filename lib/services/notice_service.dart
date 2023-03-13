import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeService extends ChangeNotifier {
  final noticeCollection = FirebaseFirestore.instance.collection('notice');

  Future<QuerySnapshot> read() async {
    // 공지사항 글 가져오기
    return noticeCollection.orderBy('date', descending: true).get();
  }

  void create(
      String title, String content, bool check, String uid, String date) async {
    // 공지사항 글 작성하기
    await noticeCollection.add({
      'uid': uid,
      'title': title,
      'content': content,
      'check': check,
      'date': date,
    });
    notifyListeners();
  }

  Future<void> update(String docId, bool isChecked) async {
    // 확인 표시 갱신
    await noticeCollection.doc(docId).update({'check': isChecked});
    notifyListeners();
  }

  void delete(String docId) async {
    // 공지사항 글 삭제
    await noticeCollection.doc(docId).delete();
    notifyListeners();
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeService extends ChangeNotifier {
  final noticeCollection = FirebaseFirestore.instance.collection('notice');

  Future<QuerySnapshot> read() async {
    // 공지사항 글 가져오기
    return noticeCollection.get();
  }

  void create(String title, String content, bool check, String uid) async {
    // 공지사항 글 작성하기
    await noticeCollection.add({
      'uid': uid,
      'title': title,
      'content': content,
      'check': check,
      'date': "2023/01/01 12:34",
    });
    notifyListeners();
  }

  Future<void> update(String docId, bool isChecked) async {
    // DocumentSnapshot snapshot = await noticeCollection.doc(docId).get();
    // isChecked = !isChecked;
    // if (snapshot.exists) {
    //   await noticeCollection.doc(docId).update({'check': isChecked});
    // }

    final noticeDoc = noticeCollection.doc(docId);
    if (isChecked == true) {
      await noticeDoc.update({'check': true});
    }
    await noticeDoc.update({'check': false});

    // _isChecked = isChecked;
    // notifyListeners();

    notifyListeners();

    // 확인 표시 갱신
  }

  void delete(String docId) async {
    // 공지사항 글 삭제

    await noticeCollection.doc(docId).delete();
    notifyListeners();
  }
}

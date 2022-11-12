import 'package:flutter/material.dart';

import 'notice_page.dart';
import 'post_page.dart';
import 'main.dart';
import 'setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var mobileWidth = MediaQuery.of(context).size.width;
    var mobileHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'SSCC Talk',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: sscctalkPrimaryColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.black,
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingPage()),
              );
            }),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  "assets/images/notice.png",
                  width: mobileWidth,
                  height: mobileHeight / 2.6,
                  fit: BoxFit.fill,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => NoticePage()));
                  },
                  child: Container(
                    width: mobileWidth - 100,
                    height: mobileHeight / 4,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'SSCC 홈커밍이 찾아왔습니다! \n 1부 - 2022 해커톤 발표평가회 / 15시30분 \n 2부 홈커밍데이 / 18시00분 / 학교 인근 술집',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(
                            color: Colors.grey[800],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'SSCC 번개모임 안내 \n 일시 : 11/9 수요일 18시, 장소 : 추후 공지 예정',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(
                            color: Colors.grey[800],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '해커톤 신청 기한 연장 공지 \n 기존 신청 기한 : 10/31 23:59 -> 11/1 23:59',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  "assets/images/post.png",
                  width: mobileWidth,
                  height: mobileHeight / 2.6,
                  fit: BoxFit.fill,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => PostPage()));
                  },
                  child: Container(
                    width: mobileWidth - 100,
                    height: mobileHeight / 4,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '12/11까지 30일동안 DailyBOJ 같이 하실 분~ \n문제 난이도와 상관없이 하루 한 문제 푸는 것을 목표로 합니다. 관심있으신 분은 연락주세요~',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(
                            color: Colors.grey[800],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '내일 11시~16시 동아리 프로젝트 진행하겠습니다.  동방 사용에 참고해주세요!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Divider(
                            color: Colors.grey[800],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '오늘 8시 이후로 동방에서 RSA 스터디를 진행할 예정입니다.  동방 사용에 참고해주세요~',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
          'SSCC TALK',
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
                              'SSCC ???????????? ??????????????????! \n 1??? - 2022 ????????? ??????????????? / 15???30??? \n 2??? ??????????????? / 18???00??? / ?????? ?????? ??????',
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
                              'SSCC ???????????? ?????? \n ?????? : 11/9 ????????? 18???, ?????? : ?????? ?????? ??????',
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
                              '????????? ?????? ?????? ?????? ?????? \n ?????? ?????? ?????? : 10/31 23:59 -> 11/1 23:59',
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
                              '12/11?????? 30????????? DailyBOJ ?????? ?????? ???~ \n?????? ???????????? ???????????? ?????? ??? ?????? ?????? ?????? ????????? ?????????. ??????????????? ?????? ???????????????~',
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
                              '?????? 11???~16??? ????????? ???????????? ?????????????????????.  ?????? ????????? ??????????????????!',
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
                              '?????? 8??? ????????? ???????????? RSA ???????????? ????????? ???????????????.  ?????? ????????? ??????????????????~',
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

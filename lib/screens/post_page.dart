import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Post Page"),
      ),
    );
  }
}

// class PostPage extends StatelessWidget {
//   const PostPage({super.key});

//   final List<Map<String, dynamic>> posts = const [
//     {
//       'title': "NFT 팀 동방 사용",
//       'content': "내일 11시~16시 동아리 프로젝트 진행하겠습니다. 동방 사용에 참고해주세요!!",
//       'date': '2022/11/11 20:01',
//     },
//     {
//       'title': "12/11까지 30일동안 DailyBOJ 같이 하실 분~",
//       'content': "문제 난이도와 상관없이 하루 한 문제 푸는 것을 목표로 합니다. 과심잇으신 분은 연락주세요~",
//       'date': '2022/11/11 17:14',
//     },
//     {
//       'title': "동방에 계신 분!",
//       'content': "지금 동방에 계신 분 연락 한번만 부탁드립니다!!!",
//       'date': '2022/11/05 18:05',
//     },
//     {
//       'title': "RSA 스터디 동방 사용",
//       'content': "오늘 8시 이후로 동방에서 RSA 스터디를 진행할 예정입니다. 동방 사용에 참고해주세요~",
//       'date': '2022/11/02 12:49',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           '자 유 게 시 판',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: sscctalkPrimaryColor,
//       ),
//       body: ListView.builder(
//         itemCount: posts.length,
//         itemBuilder: (context, index) {
//           final post = posts[index];
//           final title = post['title'] ?? "Title";
//           final content = post['content'] ?? "Content";
//           final date = post['date'] ?? "2000/01/01 00:00";
//           return Feed(title: title, content: content, date: date);
//         },
//         physics: BouncingScrollPhysics(),
//       ),

//       /// 글쓰기 버튼
//       floatingActionButton: FloatingActionButton(
//         heroTag: 'postFAB',
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => Messagetext()),
//           );
//         },
//         backgroundColor: Colors.black,
//         child: const Icon(
//           Icons.create,
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }
// }

// /// 피드 클래스
// class Feed extends StatefulWidget {
//   const Feed(
//       {Key? key,
//       required this.title,
//       required this.content,
//       required this.date})
//       : super(key: key);

//   final String title;
//   final String content;
//   final String date;

//   @override
//   State<Feed> createState() => _FeedState();
// }

// class _FeedState extends State<Feed> {
//   bool isFavorite = false; // 좋아요 여부

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// 제목
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),

//           /// 설명
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.content,
//             ),
//           ),

//           /// 날짜
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.date,
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//           ),

//           /// 아이콘
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(
//                   CupertinoIcons.heart,
//                   color: isFavorite ? Colors.pink : Colors.black,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isFavorite = !isFavorite;
//                   });
//                 },
//               ),

//               /// 댓글
//               IconButton(
//                 icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black),
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return CommentUI();
//                     },
//                   );
//                 },
//               ),
//               Spacer(),

//               /// 삭제
//               IconButton(
//                 icon: Icon(CupertinoIcons.delete, color: Colors.black),
//                 onPressed: () {
//                   deletePost(context);
//                 },
//               ),
//             ],
//           ),
//           Divider()
//         ],
//       ),
//     );
//   }
// }

// /// 글쓰기 화면
// class Messagetext extends StatelessWidget {
//   const Messagetext({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 1,
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           "SSCC TALK",
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "글쓰기",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 28,
//                 ),
//               ),
//               SizedBox(height: 15),

//               /// 제목
//               SizedBox(
//                 height: 65,
//                 width: 500,
//                 child: TextField(
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   obscureText: false,
//                   maxLength: 30,
//                   decoration: InputDecoration(
//                       hintText: "제목",
//                       counterText: '',
//                       focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black))),
//                 ),
//               ),

//               /// 내용
//               SizedBox(
//                 width: 500,
//                 child: TextField(
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     hintText: "내용",
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),

//               /// 작성하기 버튼
//               Center(
//                 child: SizedBox(
//                   width: 200,
//                   height: 40,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: sscctalkPrimaryColor, elevation: 0),
//                     child: Text(
//                       "작성하기",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<dynamic> deletePost(BuildContext context) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) => AlertDialog(
//       content: Text(
//         "정말 삭제 하시겠어요?",
//         style: TextStyle(fontSize: 16),
//       ),
//       actions: [
//         /// 네
//         ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(
//               Colors.white,
//             ),
//             elevation: MaterialStateProperty.all<double>(0),
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text(
//             '네',
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.red,
//             ),
//           ),
//         ),

//         /// 아니오
//         ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all<Color>(
//               Colors.white,
//             ),
//             elevation: MaterialStateProperty.all<double>(0),
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text(
//             '아니오',
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

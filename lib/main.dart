import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/auth_service.dart';
import 'services/notice_service.dart';
import 'services/post_service.dart';

import 'screens/main_body.dart';
import 'screens/login_page.dart';
import 'screens/write_notice_page.dart';
import 'screens/write_post_page.dart';
import 'screens/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main 함수에서 async 사용하기 위해
  await Firebase.initializeApp(); // firebase 앱 시작
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => NoticeService()),
        ChangeNotifierProvider(create: (context) => PostService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthService>().currentUser();
    String? nicknameMain = context.read<AuthService>().copynickname;
    user?.updateDisplayName(nicknameMain);

    // user?.updateDisplayName("isaac Ha");;

    /// initialRoute
    /// 로그인 정보가 없으면 로그인 화면을, 있으면 메인 화면을 표시한다.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: NoGlowScrollBehavior(),
      title: 'SSCC TALK',
      initialRoute: user == null ? '/' : '/main',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainBody(),
        '/notice/write_notice': (context) => WriteNoticePage(),
        '/post/write_post': (context) => WritePostPage(),
      },
    );
  }
}

/// PREVIEW

// import 'package:flutter/foundation.dart';
// import 'package:device_preview/device_preview.dart';

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       useInheritedMediaQuery: true,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       home: const LoginPage(),
//     );
//   }
// }

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/features/board/views/board_page.dart';
import 'package:nearhere/features/home/views/home_page.dart';
import 'package:nearhere/features/post/views/post_page.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: CustomNavBar(
                selectedIdx: calculateSelectedIdx(state.uri.path)),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/board',
            builder: (context, state) => const BoardPage(),
          ),
          GoRoute(
            path: '/post',
            builder: (context, state) => const PostPage(),
          ),
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NEARHERE',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
    );
  }
}

int calculateSelectedIdx(String location) {
  switch (location) {
    case '/':
      return 0;
    case '/post':
      return 1;
    case '/board':
      return 2;
    default:
      return 0;
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/features/board/views/board_page.dart';
import 'package:nearhere/features/home/views/home_page.dart';
import 'package:nearhere/features/post/views/post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/board',
        builder: (context, state) => BoardPage(),
      ),
      GoRoute(
        path: '/post',
        builder: (context, state) => PostPage(),
      ),
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

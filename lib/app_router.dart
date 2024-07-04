import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/features/board/views/board_page.dart';
import 'package:nearhere/features/home/views/home_page.dart';
import 'package:nearhere/features/write/views/write_page.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: CustomNavBar(
              selectedIdx: calculateSelectedIdx(state.uri.path),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/board',
            builder: (context, state) => BoardPage(),
          ),
          GoRoute(
            path: '/post',
            builder: (context, state) => const PostPage(),
          ),
        ],
      ),
    ],
  );

  static int calculateSelectedIdx(String location) {
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
}

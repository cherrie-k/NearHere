import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomNavBar(
      //   selectedIdx: 2,
      // ),
      body: Center(
        child: Text('Board'),
      ),
    );
  }
}
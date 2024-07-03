import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomNavBar(
      //   selectedIdx: 0,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home'),
          ],
        ),
      ),
    );
  }
}

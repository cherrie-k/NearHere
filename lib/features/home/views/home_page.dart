import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home'),
            ElevatedButton(
              onPressed: () {
                context.push('/board');
              },
              child: Text('Go to Board'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/post');
              },
              child: Text('Go to Post'),
            ),
          ],
        ),
      ),
    );
  }
}
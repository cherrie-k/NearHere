import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/features/home/widgets/gradient_container.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomNavBar(
      //   selectedIdx: 0,
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            GradientContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 36),
                  Text(
                    'NERE HERE!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('"'),
                      Text('서울시 강남구 논현동'),
                      Text('"'),
                    ],
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.green,
                height: 200,
                child: Center(child: Text('지도')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

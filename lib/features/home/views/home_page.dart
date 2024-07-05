import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/shared/widgets/gradient_container.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

class HomePage extends StatelessWidget {
  final String location;

  const HomePage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text(location),
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

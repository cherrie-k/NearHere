import 'package:flutter/material.dart';
import 'package:nearhere/features/board/widgets/post_grid_area.dart';
import 'package:nearhere/shared/widgets/custom_app_bar.dart';
import 'package:nearhere/shared/widgets/refresh_button.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '게시판', hasLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            boardTopArea(),
            const SizedBox(height: 18),
            PostGridArea(),
          ],
        ),
      ),
    );
  }

  Widget boardTopArea() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RefreshButton(),
        const SizedBox(width: 14),
        const Text(
          '서울시 강남구 논현동',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

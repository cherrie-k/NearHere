import 'package:flutter/material.dart';
import 'package:nearhere/features/board/widgets/post_item.dart';

class PostGridArea extends StatelessWidget {
  PostGridArea({super.key});

  final List<String> _tempItems = List.generate(15, (idx) => 'Post ${idx + 1}');


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 6 / 7,
        ),
        itemCount: _tempItems.length,
        itemBuilder: (context, idx) => PostItem(
          idx: idx,
        ),
      ),
    );
  }
}

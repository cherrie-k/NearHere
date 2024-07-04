import 'package:flutter/material.dart';

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
          childAspectRatio: 188 / 211,
        ),
        itemCount: _tempItems.length,
        itemBuilder: (context, idx) => Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Text('Post ${idx + 1}'),
        ),
      ),
    );
  }
}

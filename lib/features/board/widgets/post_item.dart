import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final int idx;

  // TODO:: 게시글 사진 없는 경우 처리
  const PostItem({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, size: 20),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'PostPostPostPostPostPostPostPostPostPostPostPost ${idx + 1}',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ],
          ),
          const Spacer(),
          Image.network('https://picsum.photos/20${idx}', width: 170, height: 170),
        ],
      ),
    );
  }
}

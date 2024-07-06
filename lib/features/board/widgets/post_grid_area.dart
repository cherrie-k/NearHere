import 'package:flutter/material.dart';
import 'package:nearhere/features/board/widgets/post_item.dart';
import 'package:nearhere/shared/models/category.dart';

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
          childAspectRatio: 6.1 / 7,
        ),
        itemCount: _tempItems.length,
        itemBuilder: (context, idx) => PostItem(
          title: 'Post ${idx + 1}',
          categoryKey: CategoryKey.CUTE,
          imgUrl: 'https://picsum.photos/20${idx}',
          contents: '선릉역 3출 앞에서 웬 젊은이들이 버스킹을 하고 있네요~! 지나가다 듣기 좋아 혼자 보기 아까운 마음에 올려봅니다선릉역 3출 앞에서 웬 젊은이들이 버스킹을 하고 있네요~! 지나가다 듣기 좋아 혼자 보기 아까운 마음에 올려봅니다선릉역 3출 앞에서 웬 젊은이들이 버스킹을 하고 있네요~! 지나가다 듣기 좋아 혼자 보기 아까운 마음에 올려봅니다선릉역 3출 앞에서 웬 젊은이들이 버스킹을 하고 있네요~! 지나가다 듣기 좋아 혼자 보기 아까운 마음에 올려봅니다 ㅎㅎ',
        ),
      ),
    );
  }
}

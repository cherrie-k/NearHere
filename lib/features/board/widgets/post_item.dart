import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/shared/models/category.dart';

class PostItem extends StatelessWidget {
  final CategoryKey categoryKey;
  final String title;
  final String imgUrl;

  // TODO:: 게시글 사진 없는 경우 처리
  const PostItem({
    super.key,
    required this.categoryKey,
    required this.title,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final Category category = getCategory(categoryKey);

    return InkWell(
      onTap: () {
        context.push('/post');
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 2),
                SvgPicture.asset(
                  category.iconPath,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF343434),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imgUrl,
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/shared/models/category.dart';

class PostItem extends StatelessWidget {
  final CategoryKey categoryKey;
  final String title;
  final String? imgUrl;
  final String contents;

  const PostItem(
      {super.key,
      required this.categoryKey,
      required this.title,
      this.imgUrl,
      required this.contents});

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
          mainAxisAlignment: (imgUrl == null)
              ? MainAxisAlignment.start
              : MainAxisAlignment.start,
              // TODO: 추후 수정
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
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: (imgUrl == null)
                  ? Text(
                      contents,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(
                          0xFF595959,
                        ),
                      ),
                      softWrap: true,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Image.network(
                      imgUrl!,
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

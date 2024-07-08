import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearhere/features/board/widgets/post_text_row.dart';
import 'package:nearhere/shared/models/category.dart';
import 'package:nearhere/shared/widgets/custom_app_bar.dart';
import '../viewmodels/post_viewmodel.dart';

class PostPage extends ConsumerWidget {
  final String id;

  const PostPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsyncValue = ref.watch(postViewModelProvider(id));

    return Scaffold(
      appBar: CustomAppBar(
        title: postAsyncValue.when(
          data: (post) => post.title,
          error: (error, stack) => '',
          loading: () => 'loading',
        ),
      ),
      backgroundColor: Colors.white,
      body: postAsyncValue.when(
        data: (post) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: post.image != null
                      ? Image.network(post.image!)
                      : Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 0.8),
                          ),
                          child: Center(
                            child: Text(
                              '사진이 없어요!',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${post.createdAt.year}.${post.createdAt.month}.${post.createdAt.day}',
                    ),
                    const Text(
                      ' | ',
                    ),
                    Text(
                      '${post.createdAt.hour}:${post.createdAt.minute}',
                    ),
                    const SizedBox(width: 2),
                  ],
                ),
                const SizedBox(height: 6),
                PostTextRow(
                  text: post.title,
                  categoryKey: CategoryKey.values.firstWhere(
                    (e) => e.toString() == 'CategoryKey.${post.category}',
                  ),
                ),
                const SizedBox(height: 8),
                PostTextRow(text: post.address),
                const SizedBox(height: 16),
                const Divider(
                  color: Color(0xFFC0C0C0),
                  height: 1,
                  thickness: 1,
                ),
                const SizedBox(height: 16),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 8),
                  width: double.infinity,
                  child: Text(
                    post.content,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

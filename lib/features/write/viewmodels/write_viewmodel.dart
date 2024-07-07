import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearhere/shared/repositories/post_repository.dart';
import '../../../shared/models/post.dart';

class WriteViewModel extends StateNotifier<Post> {
  WriteViewModel(this._repository)
      : super(Post(
          id: '',
          title: '',
          address: '',
          category: '',
          image: null,
          content: '',
          createdAt: DateTime.now(),
        ));

  final PostRepository _repository;

  Future<void> createPost() async {
    await _repository.createPost(state);
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateAddress(String address) {
    state = state.copyWith(address: address);
  }

  void updateCategory(String category) {
    state = state.copyWith(category: category);
  }

  void updateImage(String? image) {
    state = state.copyWith(image: image);
  }

  void updateContent(String content) {
    state = state.copyWith(content: content);
  }
}

final writeViewModelProvider =
    StateNotifierProvider<WriteViewModel, Post>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return WriteViewModel(repository);
});
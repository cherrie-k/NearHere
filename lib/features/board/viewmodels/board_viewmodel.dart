import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearhere/shared/models/post.dart';
import 'package:nearhere/shared/repositories/post_repository.dart';

class BoardViewModel extends StateNotifier<List<Post>> {
  BoardViewModel(this._repository) : super([]) {
    fetchPosts();
  }

  final PostRepository _repository;

  Future<void> fetchPosts() async {
    final response = await _repository.getPosts();
    state = response;
  }

  Future<void> deletePost(String id) async {
    await _repository.deletePost(id);
    state = state.where((post) => post.id != id).toList();
  }
}

final boardViewModelProvider =
    StateNotifierProvider<BoardViewModel, List<Post>>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return BoardViewModel(repository);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/models/post.dart';
import '../../../shared/repositories/post_repository.dart';

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
  final ImagePicker _picker = ImagePicker();

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

  void updateContent(String content) {
    state = state.copyWith(content: content);
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(image: image.path);
    }
  }
}

final writeViewModelProvider =
    StateNotifierProvider<WriteViewModel, Post>((ref) {
  final repository = ref.watch(postRepositoryProvider);
  return WriteViewModel(repository);
});
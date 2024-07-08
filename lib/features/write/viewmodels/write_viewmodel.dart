import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nearhere/shared/models/post.dart';
import 'package:nearhere/shared/repositories/post_repository.dart';

class WriteViewModel extends StateNotifier<Post> {
  WriteViewModel(this._repository)
      : super(
          Post(
            id: '',
            title: '',
            address: '',
            category: '',
            image: null,
            content: '',
            createdAt: DateTime.now(),
          ),
        );

  final PostRepository _repository;
  final ImagePicker _picker = ImagePicker();

  Future<void> createPost() async {
    if (state.image != null) {
      final imageUrl = await _repository.uploadImage(File(state.image!));
      state = state.copyWith(image: imageUrl);
    }
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

final writeViewModelProvider = StateNotifierProvider<WriteViewModel, Post>(
  (ref) {
    final repository = ref.watch(postRepositoryProvider);
    return WriteViewModel(repository);
  },
);

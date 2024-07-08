import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearhere/shared/models/post.dart';

class PostRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL']!));

  Future<List<Post>> getPosts() async {
    print('Fetching posts from: ${_dio.options.baseUrl}/posts');

    final response = await _dio.get('/posts');
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }

  Future<Post> getPost(String id) async {
    print('Fetching post from: ${_dio.options.baseUrl}/posts/$id');
    final response = await _dio.get('/posts/$id');
    return Post.fromJson(response.data);
  }

  Future<Post> createPost(Post post) async {
    final response = await _dio.post('/posts', data: post.toJson());
    return Post.fromJson(response.data);
  }

  Future<void> deletePost(String id) async {
    await _dio.delete('/posts/$id');
  }

  Future<String> uploadImage(File imageFile) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });
    final response = await _dio.post('/upload', data: formData);
    return response.data['url'];
  }
}

final postRepositoryProvider = Provider((ref) => PostRepository());

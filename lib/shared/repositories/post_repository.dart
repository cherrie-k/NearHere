import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearhere/shared/models/post.dart';

class PostRepository {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));

  Future<List<Post>> getPosts() async {
    final response = await _dio.get('/posts');
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }

  Future<Post> getPost(String id) async {
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
}

final postRepositoryProvider = Provider((ref) => PostRepository());
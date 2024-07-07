import 'package:alfred/alfred.dart';

class Post {
  String id;
  String title;
  String address;
  String category;
  String? image;
  String content;
  DateTime createdAt;

  Post({
    required this.id,
    required this.title,
    required this.address,
    required this.category,
    this.image,
    required this.content,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'category': category,
      'image': image,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

final List<Post> blogPosts = [];

void main() async {
  final app = Alfred();

  // 글 작성
  app.post('/posts', (req, res) async {
    final body = await req.bodyAsJsonMap;
    final post = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: body['title'],
      address: body['address'],
      category: body['category'],
      image: body['image'],
      content: body['content'],
      createdAt: DateTime.now(),
    );
    blogPosts.add(post);
    res.json(post.toJson());
  });

  // 전체 게시글 불러옴
  app.get('/posts', (req, res) async {
    res.json(blogPosts.map((post) => post.toJson()).toList());
  });

  // 일단 만들어둔 put
  app.put('/posts/:id', (req, res) async {
    final id = req.params['id'];
    final body = await req.bodyAsJsonMap;
    final index = blogPosts.indexWhere((post) => post.id == id);
    if (index != -1) {
      blogPosts[index] = Post(
        id: id,
        title: body['title'],
        address: body['address'],
        category: body['category'],
        image: body['image'],
        content: body['content'],
        createdAt: blogPosts[index].createdAt,
      );
      res.json(blogPosts[index].toJson());
    } else {
      res.statusCode = 404;
      res.json({'error': 'Post not found'});
    }
  });

  // 글 삭제
  app.delete('/posts/:id', (req, res) async {
    final id = req.params['id'];
    blogPosts.removeWhere((post) => post.id == id);
    res.json({'message': 'Post deleted'});
  });

  await app.listen(3000);
  print('Server running on port 3000');
}
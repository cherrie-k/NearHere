import 'dart:io';
import 'package:alfred/alfred.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

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

final List<Post> posts = [];
final Directory imageDir = Directory('backend/images');

void main() async {
  final app = Alfred();

  // 이미지 Serve
  app.get('/backend/images/*', (req, res) async {
    final filePath = path.join('backend/images', req.uri.pathSegments.last);
    final file = File(filePath);
    if (await file.exists()) {
      final mimeType = lookupMimeType(filePath) ?? 'application/octet-stream';
      res.headers.contentType = ContentType.parse(mimeType);
      await res.addStream(file.openRead());
      await res.close();
    } else {
      res.statusCode = HttpStatus.notFound;
      await res.send('File not found');
    }
  });

  // Root
  app.get('/', (req, res) async {
    res.send('Server is running');
  });

// 이미지 리스트 띄워주기
  app.get('/list-images', (req, res) async {
    if (!await imageDir.exists()) {
      return res.json([]);
    }

    final files = await imageDir.list().toList();
    final host =
        req.headers.host!.split(':').first; 
    final port = req.headers.host!.split(':').length > 1
        ? req.headers.host!.split(':').last
        : '3000'; 

    final imageUrls = files.map((file) {
      final filename = path.basename(file.path);
      return 'http://$host:$port/backend/images/$filename';
    }).toList();

    await res.json(imageUrls);
  });

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
    posts.add(post);
    await res.json(post.toJson());
  });

  // 이미지 업로드 처리
  app.post('/upload', (req, res) async {
    if (!await imageDir.exists()) {
      await imageDir.create(recursive: true);
    }

    final contentType = req.headers.contentType?.mimeType;
    if (contentType != 'multipart/form-data') {
      res.statusCode = HttpStatus.badRequest;
      await res.send('Invalid content type');
      return;
    }

    final boundary = req.headers.contentType?.parameters['boundary'];
    if (boundary == null) {
      res.statusCode = HttpStatus.badRequest;
      await res.send('Missing boundary');
      return;
    }

    final transformer = MimeMultipartTransformer(boundary);
    final parts = await transformer.bind(req).toList();

    for (var part in parts) {
      final contentDisposition = part.headers['content-disposition'];
      final name =
          RegExp(r'name="([^"]+)"').firstMatch(contentDisposition!)?.group(1);
      final filename = RegExp(r'filename="([^"]+)"')
          .firstMatch(contentDisposition)
          ?.group(1);

      if (name == 'file' && filename != null) {
        final filePath = path.join(imageDir.path, filename);
        final file = File(filePath);
        final sink = file.openWrite();
        await sink.addStream(part);
        await sink.close();

        final host = req.headers.host!.split(':').first;
        final port = req.headers.host!.split(':').length > 1
            ? req.headers.host!.split(':').last
            : '3000';

        final fileUrl = 'http://$host:$port/backend/images/$filename';
        await res.json({'url': fileUrl});
        return;
      }
    }

    res.statusCode = HttpStatus.badRequest;
    await res.send('No file found in request');
  });

  // 전체 게시글 불러옴
  app.get('/posts', (req, res) async {
    await res.json(posts.map((post) => post.toJson()).toList());
  });

  // 글 수정
  app.put('/posts/:id', (req, res) async {
    final id = req.params['id'];
    final body = await req.bodyAsJsonMap;
    final index = posts.indexWhere((post) => post.id == id);
    if (index != -1) {
      posts[index] = Post(
        id: id,
        title: body['title'],
        address: body['address'],
        category: body['category'],
        image: body['image'],
        content: body['content'],
        createdAt: posts[index].createdAt,
      );
      await res.json(posts[index].toJson());
    } else {
      res.statusCode = 404;
      await res.json({'error': 'Post not found'});
    }
  });

  // 글 삭제
  app.delete('/posts/:id', (req, res) async {
    final id = req.params['id'];
    posts.removeWhere((post) => post.id == id);
    await res.json({'message': 'Post deleted'});
  });

  await app.listen(3000);
  print('Server running on port 3000');
}

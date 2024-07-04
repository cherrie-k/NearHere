import 'package:flutter/material.dart';
import 'package:nearhere/shared/widgets/custom_app_bar.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    super.key,
    // required this.title, required this.location, this.contents, this.img
  });

  // final String title;
  // final String location;
  // final String? contents;
  // final String? img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '게시글 제목 넣기',
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical:14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                // height: 500,
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '2024.07.05',
                  ),
                  Text(
                    ' | ',
                  ),
                  Text(
                    '16:23',
                  ),
                  const SizedBox(width: 2),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.pink[200],
                    ),
                    child: Icon(
                      Icons.catching_pokemon,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "치즈고양이 '하루' 출몰",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "서울 강남구 봉은사로47길 40",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Divider(
                color: Color(0xFFC0C0C0),
                height: 1,
                thickness: 1,
              ),
              const SizedBox(height: 16),
              Text(
                '''학동초 앞에서 오랜만에 \‘하루\'를 봤어요! 
요즘 통 안보여서 걱정했는데 다행히 건강하게 잘 지내고 있는 것 같아요 :)''',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

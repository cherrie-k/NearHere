import 'package:flutter/material.dart';
import 'package:nearhere/features/write/widgets/labeled_input.dart';
import 'package:nearhere/shared/widgets/gradient_container.dart';
import 'package:nearhere/shared/widgets/custom_app_bar.dart';

class WritePage extends StatelessWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: '글쓰기', hasLeading: false),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GradientContainer(
                showRefreshBtn: false,
                borderRadius: BorderRadius.circular(8),
                borderStyle: Border.all(color: const Color(0xFFEDEDED), width: 2),
                child: const SizedBox(
                  width: double.infinity,
                  height: 240,
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.white,
                    size: 72,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              LabeledInput(label: '제목', widget: Container(color: Colors.pink, height: 20,))
            ],
          ),
        ),
      ),
    );
  }
}

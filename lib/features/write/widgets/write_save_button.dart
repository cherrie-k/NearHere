import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/features/write/viewmodels/write_viewmodel.dart';

class WriteSaveButton extends StatelessWidget {
  final WriteViewModel viewModel;

  const WriteSaveButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await viewModel.createPost();
        context.go('/board');
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Text(
          '저장',
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/features/write/viewmodels/write_viewmodel.dart';
import 'package:nearhere/shared/viewmodels/location_viewmodel.dart';

class WriteSaveButton extends ConsumerWidget {
  final WriteViewModel viewModel;

  const WriteSaveButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);

    return InkWell(
      onTap: () async {
        location.whenData((locationData) async {
          await viewModel.createPost(locationData.roadAddress);
        });
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

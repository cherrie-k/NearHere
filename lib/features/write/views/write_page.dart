import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:nearhere/features/write/widgets/write_custom_text_field.dart';
import 'package:nearhere/features/write/widgets/write_dropdown_field.dart';
import 'package:nearhere/features/write/widgets/write_labeled_input.dart';
import 'package:nearhere/features/write/widgets/write_refresh_field.dart';
import 'package:nearhere/features/write/widgets/write_save_button.dart';
import 'package:nearhere/shared/viewmodels/location_viewmodel.dart';
import 'package:nearhere/shared/widgets/custom_app_bar.dart';
import 'package:nearhere/shared/widgets/gradient_container.dart';
import '../viewmodels/write_viewmodel.dart';

class WritePage extends ConsumerWidget {
  const WritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(writeViewModelProvider.notifier);
    final post = ref.watch(writeViewModelProvider);
    final location = ref.watch(locationProvider);

    return KeyboardDismisser(
      child: Scaffold(
        appBar: CustomAppBar(
          title: '글쓰기',
          hasLeading: false,
          trailingAction: WriteSaveButton(viewModel: viewModel),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                    onTap: () async {
                      await viewModel.pickImage();
                    },
                    child: (post.image == null)
                        ? GradientContainer(
                            showRefreshBtn: false,
                            borderRadius: BorderRadius.circular(8),
                            borderStyle: Border.all(
                                color: const Color(0xFFEDEDED), width: 2),
                            child: const SizedBox(
                              width: double.infinity,
                              height: 240,
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.white,
                                size: 72,
                              ),
                            ),
                          )
                        : Image.file(
                            File(post.image!),
                            width: double.infinity,
                            height: 240,
                            fit: BoxFit.contain,
                          )),
                const SizedBox(height: 24),
                WriteLabeledInput(
                  label: '제목',
                  widget: WriteCustomTextField(
                    isOneLine: true,
                    onChanged: viewModel.updateTitle,
                  ),
                ),
                location.when(
                  data: (location) => WriteLabeledInput(
                    label: '위치',
                    widget: WriteRefreshField(
                      text: location.roadAddress,
                      buttonIcon: Icons.sync,
                      onTap: () {
                        debugPrint('위치 누름');
                        ref.read(locationProvider.notifier).refreshLocation();
                      },
                    ),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (error, stack) => Text("Error: $error"),
                ),
                WriteLabeledInput(
                  label: '카테고리',
                  widget: WriteDropdownField(viewModel: viewModel),
                ),
                WriteLabeledInput(
                  label: '내용',
                  widget: WriteCustomTextField(
                    isOneLine: false,
                    onChanged: viewModel.updateContent,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

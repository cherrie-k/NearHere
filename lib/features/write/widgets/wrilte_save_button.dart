import 'package:flutter/material.dart';

class WrilteSaveButton extends StatelessWidget {
  const WrilteSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          debugPrint('저장저장ㅂㅓ튼누름');
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
        ));
  }
}

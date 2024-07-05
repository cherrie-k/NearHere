import 'package:flutter/material.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final Widget widget;

  const LabeledInput({super.key, required this.label, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(fontSize: 18,),),
          ],
        ),
        const SizedBox(height: 6),
        widget,
        const SizedBox(height: 24)
      ],
    );
  }
}
import 'package:flutter/material.dart';

class WriteButtonField extends StatelessWidget {
  final IconData buttonIcon;
  final VoidCallback onTap;
  final String text;
  final Color? color;

  const WriteButtonField({
    super.key,
    required this.buttonIcon,
    required this.onTap,
    required this.text,
    this.color = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFD6D6D6),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Color(
                  0xFF343434,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Icon(
              buttonIcon,
              color: const Color(0xFF595959),
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

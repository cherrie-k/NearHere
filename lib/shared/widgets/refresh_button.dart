import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        debugPrint('REFRESH button pressed');
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x2E000000),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: const Icon(
          Icons.refresh,
          color: Colors.grey,
        ),
      ),
    );
  }
}

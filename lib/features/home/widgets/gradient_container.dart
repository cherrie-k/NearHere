import 'package:flutter/material.dart';
import 'package:nearhere/shared/widgets/refresh_button.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xB35793CA), // #5793CA with 70% opacity
            Color(0xB360A8B4), // #60A8B4 with 70% opacity
            Color(0xB377DD7C), // #77DD7C with 70% opacity
            Color(0xB3FFFFFF), // #FFFFFF with 70% opacity
          ],
          stops: [0.0, 0.1, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          child,
          const Positioned(
            bottom: 16,
            right: 16,
            child: RefreshButton(),
          ),
        ],
      ),
    );
  }
}

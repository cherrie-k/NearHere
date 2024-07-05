import 'package:flutter/material.dart';
import 'package:nearhere/shared/widgets/refresh_button.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final bool showRefreshBtn;
  final Border? borderStyle;
  final BorderRadius? borderRadius;
  // final List<BoxShadow>? boxShadow;

  const GradientContainer({
    super.key,
    required this.child,
    this.showRefreshBtn = true,
    this.borderStyle,
    this.borderRadius,
    // this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: borderStyle,
        borderRadius: borderRadius,
        // boxShadow: boxShadow,
        color: Colors.white,
        gradient: const RadialGradient(
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
          if (showRefreshBtn)
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

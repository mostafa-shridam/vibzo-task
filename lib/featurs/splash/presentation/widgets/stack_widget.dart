import 'package:flutter/material.dart';

import '../animation/controllers/main_animation_controller.dart';

class ScreenVisibility extends StatelessWidget {
  final MainAnimationController controller;
  final Widget child;

  const ScreenVisibility({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.controller,
      builder: (context, _) {
        final opacity =
            controller.entryOpacity.value * controller.exitOpacity.value;

        if (opacity <= 0) return const SizedBox.shrink();

        final offsetX =
            controller.entryOffsetX.value + controller.exitOffsetX.value;
        final offsetY = controller.floatingOffset.value;

        return RepaintBoundary(
          child: Transform.translate(
            offset: Offset(offsetX, offsetY),
            child: Opacity(opacity: opacity, child: child),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../animation/controllers/main_animation_controller.dart';

class SplashGridLayer extends StatelessWidget {
  final List<String> images;
  final bool isSecondSplash;
  final MainAnimationController animationController;

  const SplashGridLayer({
    super.key,
    required this.images,
    required this.animationController,
    this.isSecondSplash = false,
  });

  @override
  Widget build(BuildContext context) {
    if (images.length < 5) return const SizedBox.shrink();

    return Column(
      children: [
        Expanded(flex: 2, child: _buildStaggeredItem(0, images[0])),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: isSecondSplash ? 2 : 3,
                child: _buildStaggeredItem(1, images[1]),
              ),
              Expanded(
                flex: isSecondSplash ? 3 : 2,
                child: _buildStaggeredItem(2, images[2]),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: isSecondSplash ? 3 : 2,
                child: _buildStaggeredItem(3, images[3]),
              ),
              Expanded(
                flex: isSecondSplash ? 2 : 3,
                child: _buildStaggeredItem(4, images[4]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStaggeredItem(int index, String imagePath) {
    final staggeredIntervals = [
      const Interval(0.45, 0.75, curve: Curves.easeOutCubic),
      const Interval(0.52, 0.80, curve: Curves.easeOutCubic),
      const Interval(0.59, 0.85, curve: Curves.easeOutCubic),
      const Interval(0.66, 0.90, curve: Curves.easeOutCubic),
      const Interval(0.55, 0.95, curve: Curves.easeOutCubic),
    ];

    return AnimatedBuilder(
      animation: animationController.controller,
      builder: (context, child) {
        final staggeredValue = staggeredIntervals[index].transform(
          animationController.controller.value,
        );

        return Transform.scale(
          scale: 0.8 + (staggeredValue * 0.2),
          child: Opacity(opacity: staggeredValue, child: child),
        );
      },
      child: _SplashImage(imagePath: imagePath),
    );
  }
}

class _SplashImage extends StatelessWidget {
  const _SplashImage({required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            cacheWidth: 400,
          ),
        ),
      ),
    );
  }
}

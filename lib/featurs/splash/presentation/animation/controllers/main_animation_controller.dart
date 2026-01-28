import 'package:flutter/material.dart';

class MainAnimationController {
  late final AnimationController controller;

  late final Animation<double> entryOffsetX;
  late final Animation<double> entryOffsetY;
  late final Animation<double> entryOpacity;
  late final Animation<double> floatingOffset;

  late final Animation<double> exitOffsetX;
  late final Animation<double> exitOffsetY;
  late final Animation<double> exitOpacity;
  MainAnimationController({required TickerProvider vsync}) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 5000),
    );

    entryOffsetX = Tween<double>(begin: -800, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOutCubic),
      ),
    );

    entryOffsetY = ConstantTween<double>(0).animate(controller);

    entryOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    floatingOffset = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeInOut),
      ),
    );

    exitOffsetX = Tween<double>(begin: 0, end: 800).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeInCubic),
      ),
    );

    exitOffsetY = ConstantTween<double>(0).animate(controller);

    exitOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void play() => controller.forward();
  void dispose() => controller.dispose();
}

import 'package:company_task/core/enums/constants_enums.dart';
import 'package:company_task/core/local_services/local_storage.dart';
import 'package:company_task/featurs/home/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../auth/presentation/views/auth_page.dart';
import '../animation/controllers/main_animation_controller.dart';
import '../widgets/stack_widget.dart';
import '../widgets/splash_grid_layer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final List<MainAnimationController> _controllers;
  late final List<List<String>> _screenAssets;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAssets();
    _startSequence();
  }

  void _navigateToLogin() {
    final isLoggedIn =
        LocalStorage.instance.get(Constants.loginKey.name) ?? false;
    if (isLoggedIn) {
      context.go(HomePage.routeName);
    } else {
      context.go(LoginPage.routeName);
    }
  }

  void _initializeControllers() {
    _controllers = List.generate(
      2,
      (_) => MainAnimationController(vsync: this),
    );
  }

  void _initializeAssets() {
    _screenAssets = [
      [
        Assets.images.splash.firstTop.path,
        Assets.images.splash.firstCenterLeft.path,
        Assets.images.splash.firstCenterRight.path,
        Assets.images.splash.firstBottomLeft.path,
        Assets.images.splash.firstBottomRight.path,
      ],
      [
        Assets.images.splash.secTop.path,
        Assets.images.splash.secCenterLeft.path,
        Assets.images.splash.secCenterRight.path,
        Assets.images.splash.secBottomLeft.path,
        Assets.images.splash.secBottomRight.path,
      ],
    ];
  }

  void _startSequence() {
    // تشغيل الكنترولرات بالتتابع
    for (int i = 0; i < _controllers.length; i++) {
      final delay = i * 2500;
      Future.delayed(Duration(milliseconds: delay), () {
        if (mounted) _controllers[i].play();
      });
    }

    _controllers.last.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToLogin();
      }
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(Assets.images.splash.overlay.path, fit: BoxFit.cover),
            for (int i = 0; i < 2; i++) _buildLayer(i),
            _buildLogo(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    // Entrance (Scale/Fade)
    final Animation<double> entryAnim = CurvedAnimation(
      parent: _controllers[0].controller,
      curve: const Interval(0.07, 0.24, curve: Curves.easeOutCubic),
    );

    // Exit to the Right (Offset)
    final Animation<Offset> exitMoveRight =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1.5, 0.0), // Moves 150% of its width to the right
        ).animate(
          CurvedAnimation(
            parent: _controllers[0].controller,
            curve: const Interval(0.3, 0.44, curve: Curves.easeInOutCubic),
          ),
        );

    return RepaintBoundary(
      // Crucial for Performance
      child: FadeTransition(
        opacity: entryAnim,
        child: SlideTransition(
          position: exitMoveRight,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1.0).animate(entryAnim),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SvgPicture.asset(Assets.images.splash.logo, width: 343),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLayer(int index) {
    if (_screenAssets[index].isEmpty) return const SizedBox.shrink();

    return ScreenVisibility(
      controller: _controllers[index],
      child: SplashGridLayer(
        images: _screenAssets[index],
        animationController: _controllers[index],
        isSecondSplash: index == 1,
      ),
    );
  }
}

import 'package:company_task/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GeneralScaffoldAuth extends StatelessWidget {
  const GeneralScaffoldAuth({
    super.key,
    required this.child,
    this.showCloseButton = true,
    this.showBackButton = true,
    this.title,
  });
  final Widget child;
  final bool showCloseButton;
  final bool showBackButton;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color(0xffD2D6DB),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          if (title != null && title!.isNotEmpty)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          if (showBackButton)
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 16,
              top: 50,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.black,
                  size: 16,
                ),
              ),
            ),
          if (showCloseButton)
            Positioned.directional(
              textDirection: TextDirection.ltr,
              end: 16,
              top: 50,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.accentColor,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.close, color: AppColors.black),
                ),
              ),
            ),
          Padding(padding: const EdgeInsets.all(16.0), child: child),
        ],
      ),
    );
  }
}

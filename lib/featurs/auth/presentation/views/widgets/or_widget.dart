import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'or',
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: Color(0xff6C737F)),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

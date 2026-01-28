import 'package:company_task/core/widgets/custom_button.dart';
import 'package:company_task/featurs/home/presentation/home.dart';
import 'package:company_task/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/help_functions.dart';
import '../../../../core/theme/app_colors.dart';

class SecPage extends StatelessWidget {
  const SecPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const SizedBox(height: 100),
        Text('Languages You Speak'),
        Wrap(
          children: List.generate(
            languages.length,
            (index) => _LanguageItem(title: languages[index]),
          ),
        ),
        const SizedBox(height: 12),
        Text('Where Are You From'),
        Wrap(
          children: List.generate(
            countries.length,
            (index) => _LanguageItem(
              title: countries.keys.elementAt(index),
              image: countries.values.elementAt(index),
            ),
          ),
        ),

        const Spacer(),
        CustomButton(
          text: 'Continue',
          onPressed: () {
            context.go(HomePage.routeName);
          },
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem({this.image, required this.title});
  final String? image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          if (image != null && image!.isNotEmpty) SvgPicture.asset(image!),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}

List<String> languages = [
  'Engish',
  'French',
  'German',
  'العربية',
  'الفارسية',
  'More',
];
Map<String, String> countries = {
  'UAE': Assets.images.svgs.countryFlags,
  'Egypt': Assets.images.svgs.countryFlags,
  'Saudi Arabia': Assets.images.svgs.countryFlags,
  'Kuwait': Assets.images.svgs.countryFlags,
  'Bahrain ': Assets.images.svgs.countryFlags,
  'More': '',
};

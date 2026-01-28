import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';

enum GenderValue { male, female }

final ValueNotifier<GenderValue?> genderValue = ValueNotifier(null);

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final gender = {
      'Female': Assets.images.svgs.femaleSymbol,
      'Male': Assets.images.svgs.maleSymbol,
    };

    return ValueListenableBuilder<GenderValue?>(
      valueListenable: genderValue,
      builder: (context, selected, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(gender.length, (index) {
            final key = gender.keys.elementAt(index);
            final icon = gender.values.elementAt(index);
            final value = key == 'Male' ? GenderValue.male : GenderValue.female;

            final baseColor = value == GenderValue.male
                ? const Color(0xff175CD3)
                : AppColors.primaryColor;

            final isSelected = selected == value;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => genderValue.value = value,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: baseColor,
                      width: isSelected ? 2.5 : 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: isSelected
                        ? baseColor.withValues(alpha: .15)
                        : Colors.transparent,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: baseColor.withValues(alpha: .2),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(icon, width: 24, height: 24),
                      const SizedBox(width: 6),
                      Text(
                        key,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: baseColor,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

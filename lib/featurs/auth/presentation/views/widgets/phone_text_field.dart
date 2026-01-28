import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/my_text_filed.dart';
import '../../../../../gen/assets.gen.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({super.key, required this.phoneController});

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      labelText: 'Phone Number',
      controller: phoneController,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
      prefix: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const SizedBox(width: 12),
              SvgPicture.asset(Assets.images.svgs.countryFlags),
              const SizedBox(width: 8),
              Text('+20'),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}

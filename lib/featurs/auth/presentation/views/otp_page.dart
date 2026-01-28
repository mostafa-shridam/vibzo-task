import 'package:company_task/core/helper/help_functions.dart';
import 'package:company_task/featurs/auth/presentation/views/create_password.dart';
import 'package:company_task/featurs/auth/presentation/views/widgets/phone_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/my_text_filed.dart';
import '../../../../gen/assets.gen.dart';

import 'widgets/general_scaffold_auth.dart';
import 'widgets/my_check_box.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.phone});
  final String phone;
  static const routeName = '/otp-page';
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffoldAuth(
      title: 'Verify Your Phone Number',
      child: Form(
        key: _formKey,
        child: ValueListenableBuilder<bool>(
          valueListenable: showOtpField,
          builder: (context, showOtp, _) {
            return Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                PhoneTextField(phoneController: phoneController),

                // الاختيار يظل ظاهر لغاية ما المستخدم يضغط Continue
                if (!showOtp) ...[
                  Text(
                    'How do you want to be verified?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  MyCheckBox(),
                ],

                // حقل OTP يظهر بعد الضغط على Continue
                if (showOtp) ...[
                  MyTextField(
                    labelText: 'Verification Code',
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your verification code';
                      }
                      return null;
                    },
                  ),
                ],

                const Spacer(),

                CustomButton(
                  icon: Assets.images.svgs.loginArrow,
                  text: 'Continue',
                  onPressed: () {
                    if (verifyMethod.value != null) {
                      showOtpField.value = true;

                      if (_formKey.currentState!.validate()) {
                        if (phoneController.text.isNotEmpty &&
                            otpController.text.isNotEmpty) {
                          context.pushNamed(CreatePasswordPage.routeName);
                        }
                      }
                    } else {
                      showSnackBar(
                        message: 'Please select a verification method',
                      );
                    }
                  },
                  textColor: AppColors.white,
                ),
                const SizedBox(height: 32),
              ],
            );
          },
        ),
      ),
    );
  }
}

final ValueNotifier<bool> showOtpField = ValueNotifier(false);
